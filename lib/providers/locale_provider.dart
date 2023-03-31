import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'locale_provider.freezed.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState({
    required Locale locale,
  }) = _LocaleState;

  const LocaleState._();
}

final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleState>(
    (ref) => LocaleNotifier());

class LocaleNotifier extends StateNotifier<LocaleState> {
  LocaleNotifier() : super(const LocaleState(locale: Locale("en")));
  void changeLocale() {
    if (state.locale.languageCode == "en") {
      state = state.copyWith(locale: const Locale("ru"));
    } else {
      state = state.copyWith(locale: const Locale("en"));
    }
  }
}
