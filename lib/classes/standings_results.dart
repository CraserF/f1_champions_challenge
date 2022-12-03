import 'package:f1_champions_challenge/classes/constructor.dart';

import 'driver.dart';

/// Class that includes the race standings per year.
class Standing {
  final int season;
  final int? round;
  final double? championsPoints;
  final int? championsWins;
  final Driver? driver;
  final Constructor? constructor;

  /*
    {"season":"2005","round":"19",
    "DriverStandings":
      [
        {"position":"1","positionText":"1","points":"133","wins":"7",
        "Driver":{"driverId":"alonso","permanentNumber":"14","code":"ALO","url":"http:\/\/en.wikipedia.org\/wiki\/Fernando_Alonso","givenName":"Fernando","familyName":"Alonso","dateOfBirth":"1981-07-29","nationality":"Spanish"}, 
        "Constructors":[{"constructorId":"renault","url":"http:\/\/en.wikipedia.org\/wiki\/Renault_in_Formula_One","name":"Renault","nationality":"French"}]
        }
      ]
    }
  */
  Standing.createFromMap(Map<String, dynamic> map)
      : season = int.tryParse(map['season']) ?? 0,
        round = int.tryParse(map['round']),
        championsPoints = double.parse(map['DriverStandings'][0]['points']),
        championsWins = int.tryParse(map['DriverStandings'][0]['wins']),
        driver = Driver.fromMap(
          map['DriverStandings'][0]['Driver'],
        ),
        constructor =
            Constructor.fromMap(map['DriverStandings'][0]['Constructors'][0]);
}
