// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesScreenEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) activeTabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? activeTabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? activeTabChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActiveTabChanged value) activeTabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActiveTabChanged value)? activeTabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActiveTabChanged value)? activeTabChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesScreenEventCopyWith<FavoritesScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesScreenEventCopyWith<$Res> {
  factory $FavoritesScreenEventCopyWith(FavoritesScreenEvent value,
          $Res Function(FavoritesScreenEvent) then) =
      _$FavoritesScreenEventCopyWithImpl<$Res, FavoritesScreenEvent>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$FavoritesScreenEventCopyWithImpl<$Res,
        $Val extends FavoritesScreenEvent>
    implements $FavoritesScreenEventCopyWith<$Res> {
  _$FavoritesScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActiveTabChangedCopyWith<$Res>
    implements $FavoritesScreenEventCopyWith<$Res> {
  factory _$$_ActiveTabChangedCopyWith(
          _$_ActiveTabChanged value, $Res Function(_$_ActiveTabChanged) then) =
      __$$_ActiveTabChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ActiveTabChangedCopyWithImpl<$Res>
    extends _$FavoritesScreenEventCopyWithImpl<$Res, _$_ActiveTabChanged>
    implements _$$_ActiveTabChangedCopyWith<$Res> {
  __$$_ActiveTabChangedCopyWithImpl(
      _$_ActiveTabChanged _value, $Res Function(_$_ActiveTabChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ActiveTabChanged(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ActiveTabChanged implements _ActiveTabChanged {
  const _$_ActiveTabChanged(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FavoritesScreenEvent.activeTabChanged(index: $index)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActiveTabChangedCopyWith<_$_ActiveTabChanged> get copyWith =>
      __$$_ActiveTabChangedCopyWithImpl<_$_ActiveTabChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) activeTabChanged,
  }) {
    return activeTabChanged(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? activeTabChanged,
  }) {
    return activeTabChanged?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? activeTabChanged,
    required TResult orElse(),
  }) {
    if (activeTabChanged != null) {
      return activeTabChanged(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActiveTabChanged value) activeTabChanged,
  }) {
    return activeTabChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActiveTabChanged value)? activeTabChanged,
  }) {
    return activeTabChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActiveTabChanged value)? activeTabChanged,
    required TResult orElse(),
  }) {
    if (activeTabChanged != null) {
      return activeTabChanged(this);
    }
    return orElse();
  }
}

abstract class _ActiveTabChanged implements FavoritesScreenEvent {
  const factory _ActiveTabChanged(final int index) = _$_ActiveTabChanged;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_ActiveTabChangedCopyWith<_$_ActiveTabChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoritesScreenState {
  int get activeTabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesScreenStateCopyWith<FavoritesScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesScreenStateCopyWith<$Res> {
  factory $FavoritesScreenStateCopyWith(FavoritesScreenState value,
          $Res Function(FavoritesScreenState) then) =
      _$FavoritesScreenStateCopyWithImpl<$Res, FavoritesScreenState>;
  @useResult
  $Res call({int activeTabIndex});
}

/// @nodoc
class _$FavoritesScreenStateCopyWithImpl<$Res,
        $Val extends FavoritesScreenState>
    implements $FavoritesScreenStateCopyWith<$Res> {
  _$FavoritesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTabIndex = null,
  }) {
    return _then(_value.copyWith(
      activeTabIndex: null == activeTabIndex
          ? _value.activeTabIndex
          : activeTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoritesScreenStateCopyWith<$Res>
    implements $FavoritesScreenStateCopyWith<$Res> {
  factory _$$_FavoritesScreenStateCopyWith(_$_FavoritesScreenState value,
          $Res Function(_$_FavoritesScreenState) then) =
      __$$_FavoritesScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeTabIndex});
}

/// @nodoc
class __$$_FavoritesScreenStateCopyWithImpl<$Res>
    extends _$FavoritesScreenStateCopyWithImpl<$Res, _$_FavoritesScreenState>
    implements _$$_FavoritesScreenStateCopyWith<$Res> {
  __$$_FavoritesScreenStateCopyWithImpl(_$_FavoritesScreenState _value,
      $Res Function(_$_FavoritesScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTabIndex = null,
  }) {
    return _then(_$_FavoritesScreenState(
      activeTabIndex: null == activeTabIndex
          ? _value.activeTabIndex
          : activeTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FavoritesScreenState implements _FavoritesScreenState {
  const _$_FavoritesScreenState({this.activeTabIndex = 0});

  @override
  @JsonKey()
  final int activeTabIndex;

  @override
  String toString() {
    return 'FavoritesScreenState(activeTabIndex: $activeTabIndex)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoritesScreenStateCopyWith<_$_FavoritesScreenState> get copyWith =>
      __$$_FavoritesScreenStateCopyWithImpl<_$_FavoritesScreenState>(
          this, _$identity);
}

abstract class _FavoritesScreenState implements FavoritesScreenState {
  const factory _FavoritesScreenState({final int activeTabIndex}) =
      _$_FavoritesScreenState;

  @override
  int get activeTabIndex;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritesScreenStateCopyWith<_$_FavoritesScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
