import 'package:f1_champions_challenge/classes/standings_results.dart';
import 'package:f1_champions_challenge/pages/results_page.dart';
import 'package:flutter/material.dart';

// https://fonts.google.com/specimen/Zen+Dots?selected=Material+Icons:add_chart&preview.text=F1&preview.text_type=custom
// https://pub.dev/packages/link_preview_generator - display image
class ChampionWidget extends StatelessWidget {
  const ChampionWidget({
    super.key,
    required this.standing,
  });

  final Standing standing;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            title: Text(
              standing.driver?.fullName ?? '',
              style: Theme.of(context).textTheme.displaySmall,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              standing.season.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultsPage(standing: standing),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
