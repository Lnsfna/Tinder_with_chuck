import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'favorites_provider.freezed.dart';
@freezed
abstract class FavJokesState with _$FavJokesState {
  const factory FavJokesState({
    @Default([]) List<String> favorites,
    @Default(true) isLoading,
  }) = _FavJokesState;

  const FavJokesState._();
}
final favJokesProvider = StateNotifierProvider<FavJokesNotifier, FavJokesState>((ref) => FavJokesNotifier());

class FavJokesNotifier extends StateNotifier<FavJokesState> {
  FavJokesNotifier() : super(FavJokesState());



  void toggleFavorite(String value) {
    state = state.copyWith(isLoading: true);
    List<String> tempFav = [for (final fav in state.favorites) fav];

    if (!tempFav.contains(value)) {
      tempFav.add(value);
    }
    state = state.copyWith(isLoading: false, favorites: tempFav);

  }

  void removeFavorite(String jokeToRem) {
    state = state.copyWith(isLoading: true);
    List<String> tempFav = [];
    for (final fav in state.favorites) {
      if (fav != jokeToRem){
        tempFav.add(fav);
      }
    }
    state = state.copyWith(isLoading: false, favorites: tempFav);

  }

}