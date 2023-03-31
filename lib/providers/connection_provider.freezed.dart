// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectivityStatus {
  Statuses get curStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectivityStatusCopyWith<ConnectivityStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStatusCopyWith<$Res> {
  factory $ConnectivityStatusCopyWith(
          ConnectivityStatus value, $Res Function(ConnectivityStatus) then) =
      _$ConnectivityStatusCopyWithImpl<$Res, ConnectivityStatus>;
  @useResult
  $Res call({Statuses curStatus});
}

/// @nodoc
class _$ConnectivityStatusCopyWithImpl<$Res, $Val extends ConnectivityStatus>
    implements $ConnectivityStatusCopyWith<$Res> {
  _$ConnectivityStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curStatus = null,
  }) {
    return _then(_value.copyWith(
      curStatus: null == curStatus
          ? _value.curStatus
          : curStatus // ignore: cast_nullable_to_non_nullable
              as Statuses,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectivityStatusCopyWith<$Res>
    implements $ConnectivityStatusCopyWith<$Res> {
  factory _$$_ConnectivityStatusCopyWith(_$_ConnectivityStatus value,
          $Res Function(_$_ConnectivityStatus) then) =
      __$$_ConnectivityStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Statuses curStatus});
}

/// @nodoc
class __$$_ConnectivityStatusCopyWithImpl<$Res>
    extends _$ConnectivityStatusCopyWithImpl<$Res, _$_ConnectivityStatus>
    implements _$$_ConnectivityStatusCopyWith<$Res> {
  __$$_ConnectivityStatusCopyWithImpl(
      _$_ConnectivityStatus _value, $Res Function(_$_ConnectivityStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curStatus = null,
  }) {
    return _then(_$_ConnectivityStatus(
      curStatus: null == curStatus
          ? _value.curStatus
          : curStatus // ignore: cast_nullable_to_non_nullable
              as Statuses,
    ));
  }
}

/// @nodoc

class _$_ConnectivityStatus extends _ConnectivityStatus {
  const _$_ConnectivityStatus({this.curStatus = Statuses.notDetermined})
      : super._();

  @override
  @JsonKey()
  final Statuses curStatus;

  @override
  String toString() {
    return 'ConnectivityStatus(curStatus: $curStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectivityStatus &&
            (identical(other.curStatus, curStatus) ||
                other.curStatus == curStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectivityStatusCopyWith<_$_ConnectivityStatus> get copyWith =>
      __$$_ConnectivityStatusCopyWithImpl<_$_ConnectivityStatus>(
          this, _$identity);
}

abstract class _ConnectivityStatus extends ConnectivityStatus {
  const factory _ConnectivityStatus({final Statuses curStatus}) =
      _$_ConnectivityStatus;
  const _ConnectivityStatus._() : super._();

  @override
  Statuses get curStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectivityStatusCopyWith<_$_ConnectivityStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
