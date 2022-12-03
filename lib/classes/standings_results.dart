import 'package:f1_champions_challenge/classes/constructor.dart';

import 'driver.dart';

/// Class that includes the race standings per year.
class Standings {
  final int? season;
  final int? round;
  final int? championsPoints;
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
  Standings.createFromMap(Map<String, dynamic> map)
      : season = map['season'],
        round = map['round'],
        championsPoints = map['DriverStandings'][0]['points'],
        championsWins = map['DriverStandings'][0]['wins'],
        driver = Driver.fromMap(
          map['DriverStandings'][0]['Driver'],
        ),
        constructor =
            Constructor.fromMap(map['DriverStandings'][0]['Constructors'][0]);
}
