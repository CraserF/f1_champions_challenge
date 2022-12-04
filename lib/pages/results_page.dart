import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/result_widget.dart';
import '../classes/race_results.dart';
import '../services/f1_data_api.dart';
import 'package:flutter/material.dart';
import '../classes/standings_results.dart';

/// Stateful home page of the application.
class ResultsPage extends StatefulWidget {
  const ResultsPage({
    super.key,
    required this.standing,
  });
  final Standing standing;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    // Material page scaffold.
    return Scaffold(
      appBar: AppBar(
        title: Text('Race Results for ${widget.standing.season} Season'),
      ),

      /// Body that shows results
      body: FutureBuilder<List<Race>>(
        future: getRaceResults(widget.standing.season),
        builder: (context, snapshot) {
          /// Display on error.
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong. Please try reloading/restarting!',
                textAlign: TextAlign.center,
              ),
            );
          }

          /// Display while loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(),
              ),
            );
          }

          /// Scroll View for allowing sliver to dynamically load content.
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const Center(child: FaIcon(FontAwesomeIcons.trophy)),
                title: Text(
                  'Champion: ${widget.standing.driver?.fullName} · ${widget.standing.championsPoints} Points · ${widget.standing.championsWins} Wins',
                  maxLines: 2,
                ),
              ),

              /// Sliver list for dynamic displaying of content.
              SliverList(
                delegate: SliverChildListDelegate(
                  snapshot.data!
                      .map(
                        (e) => ResultWidget(
                          race: e,
                          isChampion: e.result.driver?.driverId ==
                              widget.standing.driver?.driverId,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
