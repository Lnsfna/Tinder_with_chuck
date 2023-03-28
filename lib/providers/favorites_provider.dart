import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  String? _uid;
  DatabaseReference? _db;

  FavJokesNotifier() : super(FavJokesState()){
    final _uid = FirebaseAuth.instance.currentUser!.uid;
    final _db = FirebaseDatabase.instance.ref("users");

    loadFavorites();
  }

  void updateAuthState(){
    
   _uid = FirebaseAuth.instance.currentUser!.uid;
   _db = FirebaseDatabase.instance.ref("users");
   print(_uid);
   print(_db);

   loadFavorites();
  }

  void loadFavorites() async{
      if (_uid != null && _db != null){
        try{
          final snapshot = await _db!.child("$_uid/user_favorites").get();
          if (snapshot.exists) {
          List<dynamic> jsonFav = json.decode(jsonEncode(snapshot.value));
          List<String> tempFav=
              jsonFav.map((e) => e.toString()).toList();
          state = state.copyWith(favorites: tempFav);
        } else {
          _updateDb([]);
          state = state.copyWith(favorites: []);
        }

        }on FirebaseAuthException catch (err){
          print(err);
        }

      }else{
        print("user or db are not defined");
      }
  }
  void _updateDb(List<String> jokes){
    if (_uid != null && _db != null){
      try{
        _db!.child(_uid!).update({"user_favorites" : jokes});
      }on FirebaseAuthException catch (err){
          print(err);
        }
    }else{
        print("user or db are not defined");
      }
  }

  void toggleFavorite(String value) {
    state = state.copyWith(isLoading: true);
    List<String> tempFav = [for (final fav in state.favorites) fav];

    if (!tempFav.contains(value)) {
      tempFav.add(value);
    }
    _updateDb(tempFav);
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
    _updateDb(tempFav);
    state = state.copyWith(isLoading: false, favorites: tempFav);

  }

}