import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_with_chuck/pages/home_page.dart';
import 'package:tinder_with_chuck/pages/login_page.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MaterialApp(
        title: 'Tinder with Chuck',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        // home: const LoginPage(),
        home: const MyHomePage(),
      );
  }
}