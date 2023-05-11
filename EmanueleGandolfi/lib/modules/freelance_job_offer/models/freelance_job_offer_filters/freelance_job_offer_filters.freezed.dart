// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelance_job_offer_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreelanceJobOfferFilters {
  List<String> get nda => throw _privateConstructorUsedError;
  List<String> get tipoDiRelazione => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreelanceJobOfferFiltersCopyWith<FreelanceJobOfferFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreelanceJobOfferFiltersCopyWith<$Res> {
  factory $FreelanceJobOfferFiltersCopyWith(FreelanceJobOfferFilters value,
          $Res Function(FreelanceJobOfferFilters) then) =
      _$FreelanceJobOfferFiltersCopyWithImpl<$Res, FreelanceJobOfferFilters>;
  @useResult
  $Res call({List<String> nda, List<String> tipoDiRelazione});
}

/// @nodoc
class _$FreelanceJobOfferFiltersCopyWithImpl<$Res,
        $Val extends FreelanceJobOfferFilters>
    implements $FreelanceJobOfferFiltersCopyWith<$Res> {
  _$FreelanceJobOfferFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nda = null,
    Object? tipoDiRelazione = null,
  }) {
    return _then(_value.copyWith(
      nda: null == nda
          ? _value.nda
          : nda // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tipoDiRelazione: null == tipoDiRelazione
          ? _value.tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreelanceJobOfferFiltersCopyWith<$Res>
    implements $FreelanceJobOfferFiltersCopyWith<$Res> {
  factory _$$_FreelanceJobOfferFiltersCopyWith(
          _$_FreelanceJobOfferFilters value,
          $Res Function(_$_FreelanceJobOfferFilters) then) =
      __$$_FreelanceJobOfferFiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> nda, List<String> tipoDiRelazione});
}

/// @nodoc
class __$$_FreelanceJobOfferFiltersCopyWithImpl<$Res>
    extends _$FreelanceJobOfferFiltersCopyWithImpl<$Res,
        _$_FreelanceJobOfferFilters>
    implements _$$_FreelanceJobOfferFiltersCopyWith<$Res> {
  __$$_FreelanceJobOfferFiltersCopyWithImpl(_$_FreelanceJobOfferFilters _value,
      $Res Function(_$_FreelanceJobOfferFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nda = null,
    Object? tipoDiRelazione = null,
  }) {
    return _then(_$_FreelanceJobOfferFilters(
      nda: null == nda
          ? _value._nda
          : nda // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tipoDiRelazione: null == tipoDiRelazione
          ? _value._tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FreelanceJobOfferFilters extends _FreelanceJobOfferFilters {
  const _$_FreelanceJobOfferFilters(
      {final List<String> nda = const [],
      final List<String> tipoDiRelazione = const []})
      : _nda = nda,
        _tipoDiRelazione = tipoDiRelazione,
        super._();

  final List<String> _nda;
  @override
  @JsonKey()
  List<String> get nda {
    if (_nda is EqualUnmodifiableListView) return _nda;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nda);
  }

  final List<String> _tipoDiRelazione;
  @override
  @JsonKey()
  List<String> get tipoDiRelazione {
    if (_tipoDiRelazione is EqualUnmodifiableListView) return _tipoDiRelazione;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tipoDiRelazione);
  }

  @override
  String toString() {
    return 'FreelanceJobOfferFilters(nda: $nda, tipoDiRelazione: $tipoDiRelazione)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreelanceJobOfferFiltersCopyWith<_$_FreelanceJobOfferFilters>
      get copyWith => __$$_FreelanceJobOfferFiltersCopyWithImpl<
          _$_FreelanceJobOfferFilters>(this, _$identity);
}

abstract class _FreelanceJobOfferFilters extends FreelanceJobOfferFilters {
  const factory _FreelanceJobOfferFilters(
      {final List<String> nda,
      final List<String> tipoDiRelazione}) = _$_FreelanceJobOfferFilters;
  const _FreelanceJobOfferFilters._() : super._();

  @override
  List<String> get nda;
  @override
  List<String> get tipoDiRelazione;
  @override
  @JsonKey(ignore: true)
  _$$_FreelanceJobOfferFiltersCopyWith<_$_FreelanceJobOfferFilters>
      get copyWith => throw _privateConstructorUsedError;
}
