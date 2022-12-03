import '../widgets/champion_widget.dart';
import '../services/f1_data_api.dart';
import 'package:flutter/material.dart';
import '../classes/standings_results.dart';

/// Stateful home page of the application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Material page scaffold.
    return Scaffold(
      appBar: AppBar(
        // Use the passed title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Standing>>(
        future: standingsPerYear(),
        initialData: const [],
        builder: (context, snapshot) {
          /// Display on error.
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong. Please try reloading/restarting! ${snapshot.error}',
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
              const SliverAppBar(
                title: Text(
                  'F1 World Champions',
                ),
              ),

              /// Sliver list for dynamic displaying of content.
              SliverList(
                delegate: SliverChildListDelegate(
                  snapshot.data!
                      .map((e) => ChampionWidget(standing: e))
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
