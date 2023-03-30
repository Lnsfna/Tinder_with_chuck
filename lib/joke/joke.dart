import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'joke.g.dart';

@JsonSerializable()
class Joke {
  String value;

  Joke({
    required this.value,
  });

  @override
  String toString() => value;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);
}

Future<Joke> fetchJoke() async {
  var r = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
  if (r.statusCode == 200) {
    return Joke.fromJson(jsonDecode(r.body));
  } else {
    throw Exception('Loading failed');
  }
}
