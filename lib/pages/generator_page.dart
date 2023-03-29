import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_with_chuck/providers/favorites_provider.dart';
import 'package:tinder_with_chuck/providers/cards_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class GeneratorPage extends ConsumerWidget {
   GeneratorPage({
    Key? key,
  }) : super(key: key);



  final CardSwiperController controller = CardSwiperController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(cardsProvider).cards;
    final isLoading = ref.watch(cardsProvider).isLoading;
    

    return isLoading
    ? const Center(
      child:  SizedBox(width: 50, height: 50, child: CircularProgressIndicator(),),
    )
    : Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.6,
              child: CardSwiper(
                controller: controller,
                isVerticalSwipingEnabled: false,
                cards: cards,
                onTapDisabled: () {},
                onSwipe: (index, direction) {
                  if (direction == CardSwiperDirection.left) {
                    ref.read(favJokesProvider.notifier).toggleFavorite(cards[index].value);
                  }
                  ref.read(cardsProvider.notifier).updateJoke(index);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    child: const Icon(Icons.favorite_border),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    child:  Text(AppLocalizations.of(context)!.next),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
