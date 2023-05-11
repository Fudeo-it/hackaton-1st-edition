// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hiring_job_offer_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HiringJobOfferFilters {
  List<String> get seniority => throw _privateConstructorUsedError;
  List<String> get team => throw _privateConstructorUsedError;
  List<String> get contratto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HiringJobOfferFiltersCopyWith<HiringJobOfferFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiringJobOfferFiltersCopyWith<$Res> {
  factory $HiringJobOfferFiltersCopyWith(HiringJobOfferFilters value,
          $Res Function(HiringJobOfferFilters) then) =
      _$HiringJobOfferFiltersCopyWithImpl<$Res, HiringJobOfferFilters>;
  @useResult
  $Res call(
      {List<String> seniority, List<String> team, List<String> contratto});
}

/// @nodoc
class _$HiringJobOfferFiltersCopyWithImpl<$Res,
        $Val extends HiringJobOfferFilters>
    implements $HiringJobOfferFiltersCopyWith<$Res> {
  _$HiringJobOfferFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seniority = null,
    Object? team = null,
    Object? contratto = null,
  }) {
    return _then(_value.copyWith(
      seniority: null == seniority
          ? _value.seniority
          : seniority // ignore: cast_nullable_to_non_nullable
              as List<String>,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contratto: null == contratto
          ? _value.contratto
          : contratto // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HiringJobOfferFiltersCopyWith<$Res>
    implements $HiringJobOfferFiltersCopyWith<$Res> {
  factory _$$_HiringJobOfferFiltersCopyWith(_$_HiringJobOfferFilters value,
          $Res Function(_$_HiringJobOfferFilters) then) =
      __$$_HiringJobOfferFiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> seniority, List<String> team, List<String> contratto});
}

/// @nodoc
class __$$_HiringJobOfferFiltersCopyWithImpl<$Res>
    extends _$HiringJobOfferFiltersCopyWithImpl<$Res, _$_HiringJobOfferFilters>
    implements _$$_HiringJobOfferFiltersCopyWith<$Res> {
  __$$_HiringJobOfferFiltersCopyWithImpl(_$_HiringJobOfferFilters _value,
      $Res Function(_$_HiringJobOfferFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seniority = null,
    Object? team = null,
    Object? contratto = null,
  }) {
    return _then(_$_HiringJobOfferFilters(
      seniority: null == seniority
          ? _value._seniority
          : seniority // ignore: cast_nullable_to_non_nullable
              as List<String>,
      team: null == team
          ? _value._team
          : team // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contratto: null == contratto
          ? _value._contratto
          : contratto // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_HiringJobOfferFilters extends _HiringJobOfferFilters {
  const _$_HiringJobOfferFilters(
      {final List<String> seniority = const [],
      final List<String> team = const [],
      final List<String> contratto = const []})
      : _seniority = seniority,
        _team = team,
        _contratto = contratto,
        super._();

  final List<String> _seniority;
  @override
  @JsonKey()
  List<String> get seniority {
    if (_seniority is EqualUnmodifiableListView) return _seniority;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seniority);
  }

  final List<String> _team;
  @override
  @JsonKey()
  List<String> get team {
    if (_team is EqualUnmodifiableListView) return _team;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_team);
  }

  final List<String> _contratto;
  @override
  @JsonKey()
  List<String> get contratto {
    if (_contratto is EqualUnmodifiableListView) return _contratto;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contratto);
  }

  @override
  String toString() {
    return 'HiringJobOfferFilters(seniority: $seniority, team: $team, contratto: $contratto)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HiringJobOfferFiltersCopyWith<_$_HiringJobOfferFilters> get copyWith =>
      __$$_HiringJobOfferFiltersCopyWithImpl<_$_HiringJobOfferFilters>(
          this, _$identity);
}

abstract class _HiringJobOfferFilters extends HiringJobOfferFilters {
  const factory _HiringJobOfferFilters(
      {final List<String> seniority,
      final List<String> team,
      final List<String> contratto}) = _$_HiringJobOfferFilters;
  const _HiringJobOfferFilters._() : super._();

  @override
  List<String> get seniority;
  @override
  List<String> get team;
  @override
  List<String> get contratto;
  @override
  @JsonKey(ignore: true)
  _$$_HiringJobOfferFiltersCopyWith<_$_HiringJobOfferFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
