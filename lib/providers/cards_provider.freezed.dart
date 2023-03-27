// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState {
  List<BigCard> get cards => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
  @useResult
  $Res call({List<BigCard> cards, dynamic isLoading});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<BigCard>,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardStateCopyWith<$Res> implements $CardStateCopyWith<$Res> {
  factory _$$_CardStateCopyWith(
          _$_CardState value, $Res Function(_$_CardState) then) =
      __$$_CardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BigCard> cards, dynamic isLoading});
}

/// @nodoc
class __$$_CardStateCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$_CardState>
    implements _$$_CardStateCopyWith<$Res> {
  __$$_CardStateCopyWithImpl(
      _$_CardState _value, $Res Function(_$_CardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$_CardState(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<BigCard>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$_CardState extends _CardState {
  const _$_CardState(
      {final List<BigCard> cards = const [], this.isLoading = true})
      : _cards = cards,
        super._();

  final List<BigCard> _cards;
  @override
  @JsonKey()
  List<BigCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString() {
    return 'CardState(cards: $cards, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardState &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardStateCopyWith<_$_CardState> get copyWith =>
      __$$_CardStateCopyWithImpl<_$_CardState>(this, _$identity);
}

abstract class _CardState extends CardState {
  const factory _CardState(
      {final List<BigCard> cards, final dynamic isLoading}) = _$_CardState;
  const _CardState._() : super._();

  @override
  List<BigCard> get cards;
  @override
  dynamic get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_CardStateCopyWith<_$_CardState> get copyWith =>
      throw _privateConstructorUsedError;
}
