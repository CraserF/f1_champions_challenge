/*

Driver":{"driverId":"alonso","permanentNumber":"14","code":"ALO","url":"http:\/\/en.wikipedia.org\/wiki\/Fernando_Alonso","givenName":"Fernando","familyName":"Alonso","dateOfBirth":"1981-07-29","nationality":"Spanish"}
*/

/// Encompasses all driver details.
class Driver {
  final String? driverId;
  final int? permanentNumber;
  final String? code;
  final String? name;
  final String? surname;
  final String? dob;
  final String? nationality;
  final String? url;

  /// Retrieve the drivers full name.
  String get fullName => '$name + $surname';

  /// Create an instance of the drivers class from a JSON Map.
  Driver.fromMap(Map<String, dynamic> map)
      : driverId = map['nationality'],
        dob = map['dateOfBirth'],
        name = map['givenName'],
        nationality = map['nationality'],
        surname = map['familyName'],
        permanentNumber = map['permanentNumber'],
        code = map['code'],
        url = map['url'];
}
