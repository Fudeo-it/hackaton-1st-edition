// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelance_job_offer_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreelanceJobOfferOptions {
  List<SelectOption>? get nda => throw _privateConstructorUsedError;
  List<SelectOption>? get tipoDiRelazione => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreelanceJobOfferOptionsCopyWith<FreelanceJobOfferOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreelanceJobOfferOptionsCopyWith<$Res> {
  factory $FreelanceJobOfferOptionsCopyWith(FreelanceJobOfferOptions value,
          $Res Function(FreelanceJobOfferOptions) then) =
      _$FreelanceJobOfferOptionsCopyWithImpl<$Res, FreelanceJobOfferOptions>;
  @useResult
  $Res call({List<SelectOption>? nda, List<SelectOption>? tipoDiRelazione});
}

/// @nodoc
class _$FreelanceJobOfferOptionsCopyWithImpl<$Res,
        $Val extends FreelanceJobOfferOptions>
    implements $FreelanceJobOfferOptionsCopyWith<$Res> {
  _$FreelanceJobOfferOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nda = freezed,
    Object? tipoDiRelazione = freezed,
  }) {
    return _then(_value.copyWith(
      nda: freezed == nda
          ? _value.nda
          : nda // ignore: cast_nullable_to_non_nullable
              as List<SelectOption>?,
      tipoDiRelazione: freezed == tipoDiRelazione
          ? _value.tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as List<SelectOption>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreelanceJobOfferOptionsCopyWith<$Res>
    implements $FreelanceJobOfferOptionsCopyWith<$Res> {
  factory _$$_FreelanceJobOfferOptionsCopyWith(
          _$_FreelanceJobOfferOptions value,
          $Res Function(_$_FreelanceJobOfferOptions) then) =
      __$$_FreelanceJobOfferOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SelectOption>? nda, List<SelectOption>? tipoDiRelazione});
}

/// @nodoc
class __$$_FreelanceJobOfferOptionsCopyWithImpl<$Res>
    extends _$FreelanceJobOfferOptionsCopyWithImpl<$Res,
        _$_FreelanceJobOfferOptions>
    implements _$$_FreelanceJobOfferOptionsCopyWith<$Res> {
  __$$_FreelanceJobOfferOptionsCopyWithImpl(_$_FreelanceJobOfferOptions _value,
      $Res Function(_$_FreelanceJobOfferOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nda = freezed,
    Object? tipoDiRelazione = freezed,
  }) {
    return _then(_$_FreelanceJobOfferOptions(
      nda: freezed == nda
          ? _value._nda
          : nda // ignore: cast_nullable_to_non_nullable
              as List<SelectOption>?,
      tipoDiRelazione: freezed == tipoDiRelazione
          ? _value._tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as List<SelectOption>?,
    ));
  }
}

/// @nodoc

class _$_FreelanceJobOfferOptions implements _FreelanceJobOfferOptions {
  const _$_FreelanceJobOfferOptions(
      {required final List<SelectOption>? nda,
      required final List<SelectOption>? tipoDiRelazione})
      : _nda = nda,
        _tipoDiRelazione = tipoDiRelazione;

  final List<SelectOption>? _nda;
  @override
  List<SelectOption>? get nda {
    final value = _nda;
    if (value == null) return null;
    if (_nda is EqualUnmodifiableListView) return _nda;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SelectOption>? _tipoDiRelazione;
  @override
  List<SelectOption>? get tipoDiRelazione {
    final value = _tipoDiRelazione;
    if (value == null) return null;
    if (_tipoDiRelazione is EqualUnmodifiableListView) return _tipoDiRelazione;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FreelanceJobOfferOptions(nda: $nda, tipoDiRelazione: $tipoDiRelazione)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreelanceJobOfferOptionsCopyWith<_$_FreelanceJobOfferOptions>
      get copyWith => __$$_FreelanceJobOfferOptionsCopyWithImpl<
          _$_FreelanceJobOfferOptions>(this, _$identity);
}

abstract class _FreelanceJobOfferOptions implements FreelanceJobOfferOptions {
  const factory _FreelanceJobOfferOptions(
          {required final List<SelectOption>? nda,
          required final List<SelectOption>? tipoDiRelazione}) =
      _$_FreelanceJobOfferOptions;

  @override
  List<SelectOption>? get nda;
  @override
  List<SelectOption>? get tipoDiRelazione;
  @override
  @JsonKey(ignore: true)
  _$$_FreelanceJobOfferOptionsCopyWith<_$_FreelanceJobOfferOptions>
      get copyWith => throw _privateConstructorUsedError;
}
