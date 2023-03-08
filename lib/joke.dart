import 'dart:convert';
import 'package:http/http.dart' as http;

class Joke {

  String value;


  Joke({
    required this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      value: json['value'],
    );
  }

  String get(){
    return value;
  }
   
}

Future<Joke> fetchJoke() async {
    var r = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    if (r.statusCode == 200) {
      return Joke.fromJson(jsonDecode(r.body));
    } else {
      throw Exception('Loading failed');
    }
}