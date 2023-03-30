import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/pages/info_page.dart';
import 'package:tinder_with_chuck/pages/generator_page.dart';
import 'package:tinder_with_chuck/pages/favorites_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final homeProvider = StateProvider((ref) => 0);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(homeProvider);
    Widget curPage;
    switch (page) {
      case 0:
        curPage = const InfoPage();
        break;
      case 1:
        curPage = GeneratorPage(ref);
        break;
      case 2:
        curPage = const FavoritesPage();
        break;
      default:
        throw UnimplementedError();
    }

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Expanded(child: curPage),
            SafeArea(
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.info),
                    label: AppLocalizations.of(context)!.info,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    label: AppLocalizations.of(context)!.favorites,
                  ),
                ],
                currentIndex: page,
                onTap: (value) {
                  ref.read(homeProvider.notifier).state = value;
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
