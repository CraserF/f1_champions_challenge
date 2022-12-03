import '../widgets/champion_widget.dart';
import '../services/f1_data_api.dart';
import 'package:flutter/material.dart';
import '../classes/standings_results.dart';

/// Stateful home page of the application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

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
        title: const Text('F1 World Champions'),
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
        // ],
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
