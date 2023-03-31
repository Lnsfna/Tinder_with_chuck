import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tinder_with_chuck/providers/locale_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_with_chuck/providers/favorites_provider.dart';

class InfoPage extends ConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curLocale = ref.watch(localeProvider).locale;
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.primary);

    return Scaffold(
        body: Column(children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 3.0, color: theme.colorScheme.primary),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              size: 50,
              color: style.color,
            ),
            Text(
              "Tinder with Chuck",
              style: style,
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            Text.rich(TextSpan(
                style: TextStyle(color: theme.colorScheme.secondary),
                children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.emailString,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  TextSpan(
                      text: FirebaseAuth.instance.currentUser!.email,
                      style: const TextStyle(fontSize: 20))
                ])),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            Text(AppLocalizations.of(context)!.appLanguage),
            SizedBox(
              width: 180,
              height: 30,
              child: ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.language,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 30,
                    ),
                    Text(curLocale.languageCode),
                  ],
                ),
                onPressed: () {
                  ref.read(localeProvider.notifier).changeLocale();
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            SizedBox(
              width: 180,
              height: 30,
              child: ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.logout,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 30,
                    ),
                    Text(AppLocalizations.of(context)!.signOut),
                  ],
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            SizedBox(
              width: 180,
              height: 30,
              child: ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.delete,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 30,
                    ),
                    Text(AppLocalizations.of(context)!.deleteAccount),
                  ],
                ),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.currentUser!.delete();
                    ref.read(favJokesProvider.notifier).removeData();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'requires-recent-login') {
                      showReauthenticateDialog(
                          providerConfigs: [const EmailProviderConfiguration()],
                          context: context,
                          onSignedIn: () {
                            Navigator.pop(context);

                            FirebaseAuth.instance.currentUser!.delete();
                            ref.read(favJokesProvider.notifier).removeData();
                          });
                    }
                  }
                },
              ),
            ),

            // SignOutButton(),
            // DeleteAccountButton(),
          ],
        ),
      )
    ]));
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutterfire_ui/auth.dart';

// class InfoPage extends StatelessWidget {
//  const InfoPage({super.key});

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        actions: [
//          IconButton(
//            icon: const Icon(Icons.person),
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute<ProfileScreen>(
//                  builder: (context) => ProfileScreen(
//                    appBar: AppBar(
//                      title: const Text('User Profile'),
//                    ),
//                    actions: [
//                      SignedOutAction((context) {
//                        Navigator.of(context).pop();
//                      })
//                    ],
//                  ),
//                ),
//              );
//            },
//          )
//        ],
//        automaticallyImplyLeading: false,
//      ),
//      body: Center(
//        child: Column(
//          children: [
//            Text(
//              'Welcome!',
//              style: Theme.of(context).textTheme.displaySmall,
//            ),
//            const SignOutButton(),
//          ],
//        ),
//      ),
//    );
//  }
// }