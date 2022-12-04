import 'package:f1_champions_challenge/classes/constructor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    final constructor = Constructor.fromMap({
      "constructorId": "renault",
      "url": "http:\/\/en.wikipedia.org\/wiki\/Renault_in_Formula_One",
      "name": "Renault",
      "nationality": "French"
    });
    test('Should have id', () {
      expect(constructor.constructorId, 'renault');
    });

    test('Should have url', () {
      expect(constructor.url,
          'http:\/\/en.wikipedia.org\/wiki\/Renault_in_Formula_One');
    });

    test('Should have name', () {
      expect(constructor.name, 'Renault');
    });

    test('Should have nationality', () {
      expect(constructor.nationality, 'French');
    });
  });
}
