import '../classes/race_results.dart';
import 'package:flutter/material.dart';

// https://fonts.google.com/specimen/Zen+Dots?selected=Material+Icons:add_chart&preview.text=F1&preview.text_type=custom
// https://pub.dev/packages/link_preview_generator - display image
class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.race,
    this.isChampion = false,
  });

  final Race race;
  final bool isChampion;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: isChampion ? null : 0,
          color: isChampion
              ? Theme.of(context).colorScheme.secondaryContainer
              : null,
          child: ListTile(
            title: Text(
              race.result.driver?.fullName ?? '',
              style: Theme.of(context).textTheme.displaySmall,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${race.round}. ${race.raceName}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
