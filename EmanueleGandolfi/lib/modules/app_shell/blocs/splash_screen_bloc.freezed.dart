// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() splashRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? splashRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? splashRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashRemoved value) splashRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashRemoved value)? splashRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashRemoved value)? splashRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashScreenEventCopyWith<$Res> {
  factory $SplashScreenEventCopyWith(
          SplashScreenEvent value, $Res Function(SplashScreenEvent) then) =
      _$SplashScreenEventCopyWithImpl<$Res, SplashScreenEvent>;
}

/// @nodoc
class _$SplashScreenEventCopyWithImpl<$Res, $Val extends SplashScreenEvent>
    implements $SplashScreenEventCopyWith<$Res> {
  _$SplashScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SplashRemovedCopyWith<$Res> {
  factory _$$_SplashRemovedCopyWith(
          _$_SplashRemoved value, $Res Function(_$_SplashRemoved) then) =
      __$$_SplashRemovedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SplashRemovedCopyWithImpl<$Res>
    extends _$SplashScreenEventCopyWithImpl<$Res, _$_SplashRemoved>
    implements _$$_SplashRemovedCopyWith<$Res> {
  __$$_SplashRemovedCopyWithImpl(
      _$_SplashRemoved _value, $Res Function(_$_SplashRemoved) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SplashRemoved implements _SplashRemoved {
  const _$_SplashRemoved();

  @override
  String toString() {
    return 'SplashScreenEvent.splashRemoved()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() splashRemoved,
  }) {
    return splashRemoved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? splashRemoved,
  }) {
    return splashRemoved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? splashRemoved,
    required TResult orElse(),
  }) {
    if (splashRemoved != null) {
      return splashRemoved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashRemoved value) splashRemoved,
  }) {
    return splashRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashRemoved value)? splashRemoved,
  }) {
    return splashRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashRemoved value)? splashRemoved,
    required TResult orElse(),
  }) {
    if (splashRemoved != null) {
      return splashRemoved(this);
    }
    return orElse();
  }
}

abstract class _SplashRemoved implements SplashScreenEvent {
  const factory _SplashRemoved() = _$_SplashRemoved;
}

/// @nodoc
mixin _$SplashScreenState {
  bool get splashVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashScreenStateCopyWith<SplashScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashScreenStateCopyWith<$Res> {
  factory $SplashScreenStateCopyWith(
          SplashScreenState value, $Res Function(SplashScreenState) then) =
      _$SplashScreenStateCopyWithImpl<$Res, SplashScreenState>;
  @useResult
  $Res call({bool splashVisible});
}

/// @nodoc
class _$SplashScreenStateCopyWithImpl<$Res, $Val extends SplashScreenState>
    implements $SplashScreenStateCopyWith<$Res> {
  _$SplashScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashVisible = null,
  }) {
    return _then(_value.copyWith(
      splashVisible: null == splashVisible
          ? _value.splashVisible
          : splashVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SplashScreenStateCopyWith<$Res>
    implements $SplashScreenStateCopyWith<$Res> {
  factory _$$_SplashScreenStateCopyWith(_$_SplashScreenState value,
          $Res Function(_$_SplashScreenState) then) =
      __$$_SplashScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool splashVisible});
}

/// @nodoc
class __$$_SplashScreenStateCopyWithImpl<$Res>
    extends _$SplashScreenStateCopyWithImpl<$Res, _$_SplashScreenState>
    implements _$$_SplashScreenStateCopyWith<$Res> {
  __$$_SplashScreenStateCopyWithImpl(
      _$_SplashScreenState _value, $Res Function(_$_SplashScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashVisible = null,
  }) {
    return _then(_$_SplashScreenState(
      splashVisible: null == splashVisible
          ? _value.splashVisible
          : splashVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SplashScreenState implements _SplashScreenState {
  const _$_SplashScreenState({this.splashVisible = true});

  @override
  @JsonKey()
  final bool splashVisible;

  @override
  String toString() {
    return 'SplashScreenState(splashVisible: $splashVisible)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SplashScreenStateCopyWith<_$_SplashScreenState> get copyWith =>
      __$$_SplashScreenStateCopyWithImpl<_$_SplashScreenState>(
          this, _$identity);
}

abstract class _SplashScreenState implements SplashScreenState {
  const factory _SplashScreenState({final bool splashVisible}) =
      _$_SplashScreenState;

  @override
  bool get splashVisible;
  @override
  @JsonKey(ignore: true)
  _$$_SplashScreenStateCopyWith<_$_SplashScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
