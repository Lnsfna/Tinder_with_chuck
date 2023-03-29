import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_with_chuck/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tinder_with_chuck/providers/favorites_provider.dart';


class LoginPage extends ConsumerWidget{
    const LoginPage ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      if (user != null){
        ref.read(favJokesProvider.notifier).updateAuthState();
      }

    });
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        }
        return const MyHomePage();
      },
          );   
  }
}