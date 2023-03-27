// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavJokesState {
  List<String> get favorites => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavJokesStateCopyWith<FavJokesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavJokesStateCopyWith<$Res> {
  factory $FavJokesStateCopyWith(
          FavJokesState value, $Res Function(FavJokesState) then) =
      _$FavJokesStateCopyWithImpl<$Res, FavJokesState>;
  @useResult
  $Res call({List<String> favorites, dynamic isLoading});
}

/// @nodoc
class _$FavJokesStateCopyWithImpl<$Res, $Val extends FavJokesState>
    implements $FavJokesStateCopyWith<$Res> {
  _$FavJokesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorites = null,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavJokesStateCopyWith<$Res>
    implements $FavJokesStateCopyWith<$Res> {
  factory _$$_FavJokesStateCopyWith(
          _$_FavJokesState value, $Res Function(_$_FavJokesState) then) =
      __$$_FavJokesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> favorites, dynamic isLoading});
}

/// @nodoc
class __$$_FavJokesStateCopyWithImpl<$Res>
    extends _$FavJokesStateCopyWithImpl<$Res, _$_FavJokesState>
    implements _$$_FavJokesStateCopyWith<$Res> {
  __$$_FavJokesStateCopyWithImpl(
      _$_FavJokesState _value, $Res Function(_$_FavJokesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorites = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$_FavJokesState(
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$_FavJokesState extends _FavJokesState {
  const _$_FavJokesState(
      {final List<String> favorites = const [], this.isLoading = true})
      : _favorites = favorites,
        super._();

  final List<String> _favorites;
  @override
  @JsonKey()
  List<String> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString() {
    return 'FavJokesState(favorites: $favorites, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavJokesState &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavJokesStateCopyWith<_$_FavJokesState> get copyWith =>
      __$$_FavJokesStateCopyWithImpl<_$_FavJokesState>(this, _$identity);
}

abstract class _FavJokesState extends FavJokesState {
  const factory _FavJokesState(
      {final List<String> favorites,
      final dynamic isLoading}) = _$_FavJokesState;
  const _FavJokesState._() : super._();

  @override
  List<String> get favorites;
  @override
  dynamic get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_FavJokesStateCopyWith<_$_FavJokesState> get copyWith =>
      throw _privateConstructorUsedError;
}
