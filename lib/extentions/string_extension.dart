import 'dart:convert';

extension StringExtension on String {
  /// String test =  '{ "name": "Jack", "age": 18 }';
  /// print(test.parseJson()["name"])
  /// >> name: Jack
  Map<dynamic, dynamic> parseJson() => jsonDecode(this);
}
