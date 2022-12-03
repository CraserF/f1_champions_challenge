import 'dart:convert';
import '../classes/race_results.dart';
import 'package:http/http.dart' as http;

import '../classes/standings_results.dart';
//  Load data. Filter and receive the correct data. Get Standings per Year. Then on-click get the race results.

/// URI for API call to fetch all the Champions for each year since 2005 as JSON.
final _standingsUri =
    Uri.parse('http://ergast.com/api/f1/driverStandings/1.json?offset=55');

/// Get the overall Championship standings per year.
/// Returns JSON.
Future<List<Standings>> standingsPerYear() async {
  // Fetches all the years as JSON since 2005.
  try {
    final response = await http.get(_standingsUri);
    final json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final table = json['MRData']['StandingsTable'] as Map<String, dynamic>;
    final standings = table['StandingsLists'] as List<dynamic>;
    final list = standings.map((e) => Standings.createFromMap(e)).toList();
    list.sort(
      (a, b) => a.season.compareTo(b.season),
    );
    return list;
  } catch (e) {
    print(e);
    return [];
  }
}

/// Returns the race results per year.
/// Async fetch from http://ergast.com/mrd/ api.
Future<List<Race>> getRaceResults(int year) async {
  // Fetches all the race winners for a particular year.
  final raceResultsUri = Uri.parse('https://ergast.com/api/f1/$year/results/1');

  try {
    final response = await http.get(raceResultsUri);
    final json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final table = json['MRData']['RaceTable'] as Map<String, dynamic>;
    final races = table['Races'] as List<dynamic>;
    return races.map((e) => Race.fromMap(e)).toList();
  } catch (e) {
    return [];
  }
}
