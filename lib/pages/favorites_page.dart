import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tinder_with_chuck/providers/favorites_provider.dart';


class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    var favorites = ref.watch(favJokesProvider).favorites;
    if (favorites.isEmpty) {
      return  Center(
        child:  Text(AppLocalizations.of(context)!.jokeCount(0)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(AppLocalizations.of(context)!.jokeCount(favorites.length)),
        ),
        Expanded(
          child: SafeArea(
            minimum: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: ListView(
              children: [
                for (var pair in favorites)
                  ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.delete_outline,
                          semanticLabel: 'Delete'),
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        ref.read(favJokesProvider.notifier).removeFavorite(pair);
                      },
                    ),
                    title: Text(
                      pair,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

