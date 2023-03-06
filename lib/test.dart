




import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';


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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tinder with Chuck',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Joke> futureJoke;

  @override
  void initState() {
    super.initState();
    futureJoke = fetchJoke();
  }
  void updateJoke(){
    futureJoke = fetchJoke();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(futureJoke: futureJoke,),
            const SizedBox(height: 20),
        
            ElevatedButton(
              onPressed: () {
                updateJoke();
              },
              child: const Text('Next'),
            ),
              ],
            ),
        ),
      );
    
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.futureJoke,
  });

  final Future<Joke> futureJoke;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); 
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary, 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Joke>(
          future: futureJoke,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.value, style: style,);
      
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}