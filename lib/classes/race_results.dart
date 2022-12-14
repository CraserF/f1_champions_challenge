import 'constructor.dart';
import 'driver.dart';

/// Encompasses all race details for a year.
class Race {
  final String? season;
  final String? round;
  final String? url;
  final String? raceName;
  final Circuit? circuit;
  final String? date;
  final RaceResult result;

  Race.fromMap(Map<String, dynamic> map)
      : season = map['season'],
        round = map['round'],
        url = map['url'],
        raceName = map['raceName'],
        circuit =
            map['Circuit'] != null ? Circuit.fromMap(map['Circuit']) : null,
        date = map['date'],
        result = RaceResult.fromMap(map['Results'][0]);
}

/// Results for a single race.
class RaceResult {
  final String? number;
  final String? points;
  final String? position;
  final Driver? driver;
  final Constructor? constructor;
  final FastestLap? fastestLap;

  RaceResult.fromMap(Map<String, dynamic> map)
      : number = map['number'],
        points = map['points'],
        position = map['position'],
        driver = Driver.fromMap(map['Driver']),
        fastestLap = map['FastestLap'] != null
            ? FastestLap.fromMap(map['FastestLap'])
            : null,
        constructor = Constructor.fromMap(map['Constructor']);
}

/// Circle details for a race.
class Circuit {
  final String? circuitId;
  final String? circuitName;
  final String? url;
  final Location? location;

  Circuit.fromMap(Map<String, dynamic> map)
      : circuitId = map['circuitId'],
        circuitName = map['circuitName'],
        url = map['url'],
        location =
            map['Location'] != null ? Location.fromMap(map['Location']) : null;
}

/// Location details of a race.
class Location {
  final String? lat;
  final String? long;
  final String? locality;
  final String? country;

  Location.fromMap(Map<String, dynamic> map)
      : country = map['country'],
        locality = map['locality'],
        lat = map['lat'],
        long = map['long'];
}

/// Fastest Lap of the race.
class FastestLap {
  final String? rank;
  final String? lap;
  final String? time;
  final AverageSpeed? speed;

  FastestLap.fromMap(Map<String, dynamic> map)
      : rank = map['rank'],
        lap = map['lap'],
        speed = map['AverageSpeed'] != null
            ? AverageSpeed.fromMap(map['AverageSpeed'])
            : null,
        time = map['Time']['time'];
}

/// Average speed of a race.
class AverageSpeed {
  final String? units;
  final String? speed;

  /// The average speed as a single quantity.
  String get averageSpeed => '$units$units';

  AverageSpeed.fromMap(Map<String, dynamic> map)
      : units = map['units'],
        speed = map['speed'];
}

const exampleResult = [
  {
    "season": "2022",
    "round": "1",
    "url": "http:\/\/en.wikipedia.org\/wiki\/2022_Bahrain_Grand_Prix",
    "raceName": "Bahrain Grand Prix",
    "Circuit": {
      "circuitId": "bahrain",
      "url": "http://en.wikipedia.org/wiki/Bahrain_International_Circuit",
      "circuitName": "Bahrain International Circuit",
      "Location": {
        "lat": "26.0325",
        "long": "50.5106",
        "locality": "Sakhir",
        "country": "Bahrain"
      }
    },
    "date": "2022-03-20",
    "time": "15:00:00Z",
    "Results": [
      {
        "number": "16",
        "position": "1",
        "positionText": "1",
        "points": "26",
        "Driver": {
          "driverId": "leclerc",
          "permanentNumber": "16",
          "code": "LEC",
          "url": "http:\/\/en.wikipedia.org\/wiki\/Charles_Leclerc",
          "givenName": "Charles",
          "familyName": "Leclerc",
          "dateOfBirth": "1997-10-16",
          "nationality": "Monegasque"
        },
        "Constructor": {
          "constructorId": "ferrari",
          "url": "http:\/\/en.wikipedia.org\/wiki\/Scuderia_Ferrari",
          "name": "Ferrari",
          "nationality": "Italian"
        },
        "grid": "1",
        "laps": "57",
        "status": "Finished",
        "Time": {"millis": "5853584", "time": "1:37:33.584"},
        "FastestLap": {
          "rank": "1",
          "lap": "51",
          "Time": {"time": "1:34.570"},
          "AverageSpeed": {"units": "kph", "speed": "206.018"}
        }
      }
    ]
  }
];
