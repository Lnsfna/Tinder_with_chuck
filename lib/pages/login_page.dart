// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tinder_with_chuck/pages/home_page.dart';

// class LoginPage extends ConsumerWidget{
//     const LoginPage ({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providerConfigs: const [
//               EmailProviderConfiguration(),
//             ],
//           );
//         }
//         return MyHomePage();
//       },
//           );   
//   }
// }