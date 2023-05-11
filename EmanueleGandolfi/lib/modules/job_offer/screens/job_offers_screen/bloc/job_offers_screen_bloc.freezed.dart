// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_offers_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JobOffersScreenEvent {
  JobOfferType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JobOfferType type) jobOfferTypeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JobOfferType type)? jobOfferTypeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JobOfferType type)? jobOfferTypeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ListTypeChanged value) jobOfferTypeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ListTypeChanged value)? jobOfferTypeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListTypeChanged value)? jobOfferTypeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobOffersScreenEventCopyWith<JobOffersScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobOffersScreenEventCopyWith<$Res> {
  factory $JobOffersScreenEventCopyWith(JobOffersScreenEvent value,
          $Res Function(JobOffersScreenEvent) then) =
      _$JobOffersScreenEventCopyWithImpl<$Res, JobOffersScreenEvent>;
  @useResult
  $Res call({JobOfferType type});
}

/// @nodoc
class _$JobOffersScreenEventCopyWithImpl<$Res,
        $Val extends JobOffersScreenEvent>
    implements $JobOffersScreenEventCopyWith<$Res> {
  _$JobOffersScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JobOfferType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListTypeChangedCopyWith<$Res>
    implements $JobOffersScreenEventCopyWith<$Res> {
  factory _$$_ListTypeChangedCopyWith(
          _$_ListTypeChanged value, $Res Function(_$_ListTypeChanged) then) =
      __$$_ListTypeChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JobOfferType type});
}

/// @nodoc
class __$$_ListTypeChangedCopyWithImpl<$Res>
    extends _$JobOffersScreenEventCopyWithImpl<$Res, _$_ListTypeChanged>
    implements _$$_ListTypeChangedCopyWith<$Res> {
  __$$_ListTypeChangedCopyWithImpl(
      _$_ListTypeChanged _value, $Res Function(_$_ListTypeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_ListTypeChanged(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JobOfferType,
    ));
  }
}

/// @nodoc

class _$_ListTypeChanged implements _ListTypeChanged {
  const _$_ListTypeChanged(this.type);

  @override
  final JobOfferType type;

  @override
  String toString() {
    return 'JobOffersScreenEvent.jobOfferTypeChanged(type: $type)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListTypeChangedCopyWith<_$_ListTypeChanged> get copyWith =>
      __$$_ListTypeChangedCopyWithImpl<_$_ListTypeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JobOfferType type) jobOfferTypeChanged,
  }) {
    return jobOfferTypeChanged(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JobOfferType type)? jobOfferTypeChanged,
  }) {
    return jobOfferTypeChanged?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JobOfferType type)? jobOfferTypeChanged,
    required TResult orElse(),
  }) {
    if (jobOfferTypeChanged != null) {
      return jobOfferTypeChanged(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ListTypeChanged value) jobOfferTypeChanged,
  }) {
    return jobOfferTypeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ListTypeChanged value)? jobOfferTypeChanged,
  }) {
    return jobOfferTypeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListTypeChanged value)? jobOfferTypeChanged,
    required TResult orElse(),
  }) {
    if (jobOfferTypeChanged != null) {
      return jobOfferTypeChanged(this);
    }
    return orElse();
  }
}

abstract class _ListTypeChanged implements JobOffersScreenEvent {
  const factory _ListTypeChanged(final JobOfferType type) = _$_ListTypeChanged;

  @override
  JobOfferType get type;
  @override
  @JsonKey(ignore: true)
  _$$_ListTypeChangedCopyWith<_$_ListTypeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JobOffersScreenState {
  JobOfferType get activeJobOfferType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobOffersScreenStateCopyWith<JobOffersScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobOffersScreenStateCopyWith<$Res> {
  factory $JobOffersScreenStateCopyWith(JobOffersScreenState value,
          $Res Function(JobOffersScreenState) then) =
      _$JobOffersScreenStateCopyWithImpl<$Res, JobOffersScreenState>;
  @useResult
  $Res call({JobOfferType activeJobOfferType});
}

/// @nodoc
class _$JobOffersScreenStateCopyWithImpl<$Res,
        $Val extends JobOffersScreenState>
    implements $JobOffersScreenStateCopyWith<$Res> {
  _$JobOffersScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeJobOfferType = null,
  }) {
    return _then(_value.copyWith(
      activeJobOfferType: null == activeJobOfferType
          ? _value.activeJobOfferType
          : activeJobOfferType // ignore: cast_nullable_to_non_nullable
              as JobOfferType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobOffersScreenStateCopyWith<$Res>
    implements $JobOffersScreenStateCopyWith<$Res> {
  factory _$$_JobOffersScreenStateCopyWith(_$_JobOffersScreenState value,
          $Res Function(_$_JobOffersScreenState) then) =
      __$$_JobOffersScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JobOfferType activeJobOfferType});
}

/// @nodoc
class __$$_JobOffersScreenStateCopyWithImpl<$Res>
    extends _$JobOffersScreenStateCopyWithImpl<$Res, _$_JobOffersScreenState>
    implements _$$_JobOffersScreenStateCopyWith<$Res> {
  __$$_JobOffersScreenStateCopyWithImpl(_$_JobOffersScreenState _value,
      $Res Function(_$_JobOffersScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeJobOfferType = null,
  }) {
    return _then(_$_JobOffersScreenState(
      activeJobOfferType: null == activeJobOfferType
          ? _value.activeJobOfferType
          : activeJobOfferType // ignore: cast_nullable_to_non_nullable
              as JobOfferType,
    ));
  }
}

/// @nodoc

class _$_JobOffersScreenState implements _JobOffersScreenState {
  const _$_JobOffersScreenState(
      {this.activeJobOfferType = JobOfferType.hiring});

  @override
  @JsonKey()
  final JobOfferType activeJobOfferType;

  @override
  String toString() {
    return 'JobOffersScreenState(activeJobOfferType: $activeJobOfferType)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobOffersScreenStateCopyWith<_$_JobOffersScreenState> get copyWith =>
      __$$_JobOffersScreenStateCopyWithImpl<_$_JobOffersScreenState>(
          this, _$identity);
}

abstract class _JobOffersScreenState implements JobOffersScreenState {
  const factory _JobOffersScreenState({final JobOfferType activeJobOfferType}) =
      _$_JobOffersScreenState;

  @override
  JobOfferType get activeJobOfferType;
  @override
  @JsonKey(ignore: true)
  _$$_JobOffersScreenStateCopyWith<_$_JobOffersScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
