import 'package:tinder_with_chuck/joke/joke.dart';
import 'package:tinder_with_chuck/widgets/card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
part 'cards_provider.freezed.dart';

@freezed
abstract class CardState with _$CardState {
  const factory CardState({
    @Default([]) List<BigCard> cards,
    @Default(true) isLoading,
  }) = _CardState;

  const CardState._();
}

final cardsProvider =
    StateNotifierProvider<CardsNotifier, CardState>((ref) => CardsNotifier());
CardSwiperController controller = CardSwiperController();

class CardsNotifier extends StateNotifier<CardState> {
  CardsNotifier() : super(const CardState()) {
    fillCards();
  }
  void loadNewController() {
    controller = CardSwiperController();
  }

  void fillCards() {
    controller = CardSwiperController();
    state = state.copyWith(isLoading: true);
    List<BigCard> tempCards = [];
    Future<Joke> first = fetchJoke();
    first.then((jokeobj) {
      tempCards.add(BigCard(value: jokeobj.value));
    });
    Future<Joke> second = fetchJoke();
    second.then((jokeobj) {
      tempCards.add(BigCard(value: jokeobj.value));
    }).whenComplete(
        () => state = state.copyWith(isLoading: false, cards: tempCards));
  }

  void updateJoke(int ind) {
    List<BigCard> tempCards = [for (final fav in state.cards) fav];
    Future<Joke> second = fetchJoke();
    second.then((jokeobj) {
      tempCards[ind] = BigCard(value: jokeobj.value);
    }).whenComplete(
        () => state = state.copyWith(isLoading: false, cards: tempCards));
  }
}
