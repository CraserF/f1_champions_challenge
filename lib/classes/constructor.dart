// {"constructorId":"renault","url":"http:\/\/en.wikipedia.org\/wiki\/Renault_in_Formula_One","name":"Renault","nationality":"French"}
/// Encompasses all Constructor details.
class Constructor {
  final String? constructorId;
  final String? url;
  final String? name;
  final String? nationality;

  Constructor.fromMap(Map<String, dynamic> map)
      : constructorId = map['constructorId'],
        url = map['url'],
        name = map['name'],
        nationality = map['nationality'];
}
