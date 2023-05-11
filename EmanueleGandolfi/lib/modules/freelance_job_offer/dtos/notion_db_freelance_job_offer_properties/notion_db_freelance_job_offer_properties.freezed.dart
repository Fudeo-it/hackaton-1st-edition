// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_freelance_job_offer_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbFreelanceJobOfferProperties
    _$NotionDbFreelanceJobOfferPropertiesFromJson(Map<String, dynamic> json) {
  return _NotionDbFreelanceJobOfferProperties.fromJson(json);
}

/// @nodoc
mixin _$NotionDbFreelanceJobOfferProperties {
  @JsonKey(name: 'NDA')
  NotionDbPropertySelect? get nda => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tipo di relazione')
  NotionDbPropertySelect? get tipoDiRelazione =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbFreelanceJobOfferPropertiesCopyWith<
          NotionDbFreelanceJobOfferProperties>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> {
  factory $NotionDbFreelanceJobOfferPropertiesCopyWith(
          NotionDbFreelanceJobOfferProperties value,
          $Res Function(NotionDbFreelanceJobOfferProperties) then) =
      _$NotionDbFreelanceJobOfferPropertiesCopyWithImpl<$Res,
          NotionDbFreelanceJobOfferProperties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'NDA')
          NotionDbPropertySelect? nda,
      @JsonKey(name: 'Tipo di relazione')
          NotionDbPropertySelect? tipoDiRelazione});

  $NotionDbPropertySelectCopyWith<$Res>? get nda;
  $NotionDbPropertySelectCopyWith<$Res>? get tipoDiRelazione;
}

/// @nodoc
class _$NotionDbFreelanceJobOfferPropertiesCopyWithImpl<$Res,
        $Val extends NotionDbFreelanceJobOfferProperties>
    implements $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> {
  _$NotionDbFreelanceJobOfferPropertiesCopyWithImpl(this._value, this._then);

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
              as NotionDbPropertySelect?,
      tipoDiRelazione: freezed == tipoDiRelazione
          ? _value.tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectCopyWith<$Res>? get nda {
    if (_value.nda == null) {
      return null;
    }

    return $NotionDbPropertySelectCopyWith<$Res>(_value.nda!, (value) {
      return _then(_value.copyWith(nda: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectCopyWith<$Res>? get tipoDiRelazione {
    if (_value.tipoDiRelazione == null) {
      return null;
    }

    return $NotionDbPropertySelectCopyWith<$Res>(_value.tipoDiRelazione!,
        (value) {
      return _then(_value.copyWith(tipoDiRelazione: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionDbFreelanceJobOfferPropertiesCopyWith<$Res>
    implements $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> {
  factory _$$_NotionDbFreelanceJobOfferPropertiesCopyWith(
          _$_NotionDbFreelanceJobOfferProperties value,
          $Res Function(_$_NotionDbFreelanceJobOfferProperties) then) =
      __$$_NotionDbFreelanceJobOfferPropertiesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NDA')
          NotionDbPropertySelect? nda,
      @JsonKey(name: 'Tipo di relazione')
          NotionDbPropertySelect? tipoDiRelazione});

  @override
  $NotionDbPropertySelectCopyWith<$Res>? get nda;
  @override
  $NotionDbPropertySelectCopyWith<$Res>? get tipoDiRelazione;
}

/// @nodoc
class __$$_NotionDbFreelanceJobOfferPropertiesCopyWithImpl<$Res>
    extends _$NotionDbFreelanceJobOfferPropertiesCopyWithImpl<$Res,
        _$_NotionDbFreelanceJobOfferProperties>
    implements _$$_NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> {
  __$$_NotionDbFreelanceJobOfferPropertiesCopyWithImpl(
      _$_NotionDbFreelanceJobOfferProperties _value,
      $Res Function(_$_NotionDbFreelanceJobOfferProperties) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nda = freezed,
    Object? tipoDiRelazione = freezed,
  }) {
    return _then(_$_NotionDbFreelanceJobOfferProperties(
      nda: freezed == nda
          ? _value.nda
          : nda // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      tipoDiRelazione: freezed == tipoDiRelazione
          ? _value.tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbFreelanceJobOfferProperties
    implements _NotionDbFreelanceJobOfferProperties {
  const _$_NotionDbFreelanceJobOfferProperties(
      {@JsonKey(name: 'NDA') required this.nda,
      @JsonKey(name: 'Tipo di relazione') required this.tipoDiRelazione});

  factory _$_NotionDbFreelanceJobOfferProperties.fromJson(
          Map<String, dynamic> json) =>
      _$$_NotionDbFreelanceJobOfferPropertiesFromJson(json);

  @override
  @JsonKey(name: 'NDA')
  final NotionDbPropertySelect? nda;
  @override
  @JsonKey(name: 'Tipo di relazione')
  final NotionDbPropertySelect? tipoDiRelazione;

  @override
  String toString() {
    return 'NotionDbFreelanceJobOfferProperties(nda: $nda, tipoDiRelazione: $tipoDiRelazione)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbFreelanceJobOfferPropertiesCopyWith<
          _$_NotionDbFreelanceJobOfferProperties>
      get copyWith => __$$_NotionDbFreelanceJobOfferPropertiesCopyWithImpl<
          _$_NotionDbFreelanceJobOfferProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbFreelanceJobOfferPropertiesToJson(
      this,
    );
  }
}

abstract class _NotionDbFreelanceJobOfferProperties
    implements NotionDbFreelanceJobOfferProperties {
  const factory _NotionDbFreelanceJobOfferProperties(
          {@JsonKey(name: 'NDA')
              required final NotionDbPropertySelect? nda,
          @JsonKey(name: 'Tipo di relazione')
              required final NotionDbPropertySelect? tipoDiRelazione}) =
      _$_NotionDbFreelanceJobOfferProperties;

  factory _NotionDbFreelanceJobOfferProperties.fromJson(
          Map<String, dynamic> json) =
      _$_NotionDbFreelanceJobOfferProperties.fromJson;

  @override
  @JsonKey(name: 'NDA')
  NotionDbPropertySelect? get nda;
  @override
  @JsonKey(name: 'Tipo di relazione')
  NotionDbPropertySelect? get tipoDiRelazione;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbFreelanceJobOfferPropertiesCopyWith<
          _$_NotionDbFreelanceJobOfferProperties>
      get copyWith => throw _privateConstructorUsedError;
}
