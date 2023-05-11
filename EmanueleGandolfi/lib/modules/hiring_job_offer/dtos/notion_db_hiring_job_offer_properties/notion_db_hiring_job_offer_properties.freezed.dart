// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_hiring_job_offer_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbHiringJobOfferProperties _$NotionDbHiringJobOfferPropertiesFromJson(
    Map<String, dynamic> json) {
  return _NotionDbHiringJobOfferProperties.fromJson(json);
}

/// @nodoc
mixin _$NotionDbHiringJobOfferProperties {
  @JsonKey(name: 'Team')
  NotionDbPropertySelect? get team => throw _privateConstructorUsedError;
  @JsonKey(name: 'Contratto')
  NotionDbPropertySelect? get contratto => throw _privateConstructorUsedError;
  @JsonKey(name: 'Seniority')
  NotionDbPropertySelect? get seniority => throw _privateConstructorUsedError;
  @JsonKey(name: 'RAL')
  NotionDbPropertySelect? get ral => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbHiringJobOfferPropertiesCopyWith<NotionDbHiringJobOfferProperties>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbHiringJobOfferPropertiesCopyWith<$Res> {
  factory $NotionDbHiringJobOfferPropertiesCopyWith(
          NotionDbHiringJobOfferProperties value,
          $Res Function(NotionDbHiringJobOfferProperties) then) =
      _$NotionDbHiringJobOfferPropertiesCopyWithImpl<$Res,
          NotionDbHiringJobOfferProperties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Team') NotionDbPropertySelect? team,
      @JsonKey(name: 'Contratto') NotionDbPropertySelect? contratto,
      @JsonKey(name: 'Seniority') NotionDbPropertySelect? seniority,
      @JsonKey(name: 'RAL') NotionDbPropertySelect? ral});

  $NotionDbPropertySelectCopyWith<$Res>? get team;
  $NotionDbPropertySelectCopyWith<$Res>? get contratto;
  $NotionDbPropertySelectCopyWith<$Res>? get seniority;
  $NotionDbPropertySelectCopyWith<$Res>? get ral;
}

/// @nodoc
class _$NotionDbHiringJobOfferPropertiesCopyWithImpl<$Res,
        $Val extends NotionDbHiringJobOfferProperties>
    implements $NotionDbHiringJobOfferPropertiesCopyWith<$Res> {
  _$NotionDbHiringJobOfferPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? contratto = freezed,
    Object? seniority = freezed,
    Object? ral = freezed,
  }) {
    return _then(_value.copyWith(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      contratto: freezed == contratto
          ? _value.contratto
          : contratto // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      seniority: freezed == seniority
          ? _value.seniority
          : seniority // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      ral: freezed == ral
          ? _value.ral
          : ral // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $NotionDbPropertySelectCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectCopyWith<$Res>? get contratto {
    if (_value.contratto == null) {
      return null;
    }

    return $NotionDbPropertySelectCopyWith<$Res>(_value.contratto!, (value) {
      return _then(_value.copyWith(contratto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectCopyWith<$Res>? get seniority {
    if (_value.seniority == null) {
      return null;
    }

    return $NotionDbPropertySelectCopyWith<$Res>(_value.seniority!, (value) {
      return _then(_value.copyWith(seniority: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectCopyWith<$Res>? get ral {
    if (_value.ral == null) {
      return null;
    }

    return $NotionDbPropertySelectCopyWith<$Res>(_value.ral!, (value) {
      return _then(_value.copyWith(ral: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionDbHiringJobOfferPropertiesCopyWith<$Res>
    implements $NotionDbHiringJobOfferPropertiesCopyWith<$Res> {
  factory _$$_NotionDbHiringJobOfferPropertiesCopyWith(
          _$_NotionDbHiringJobOfferProperties value,
          $Res Function(_$_NotionDbHiringJobOfferProperties) then) =
      __$$_NotionDbHiringJobOfferPropertiesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Team') NotionDbPropertySelect? team,
      @JsonKey(name: 'Contratto') NotionDbPropertySelect? contratto,
      @JsonKey(name: 'Seniority') NotionDbPropertySelect? seniority,
      @JsonKey(name: 'RAL') NotionDbPropertySelect? ral});

  @override
  $NotionDbPropertySelectCopyWith<$Res>? get team;
  @override
  $NotionDbPropertySelectCopyWith<$Res>? get contratto;
  @override
  $NotionDbPropertySelectCopyWith<$Res>? get seniority;
  @override
  $NotionDbPropertySelectCopyWith<$Res>? get ral;
}

/// @nodoc
class __$$_NotionDbHiringJobOfferPropertiesCopyWithImpl<$Res>
    extends _$NotionDbHiringJobOfferPropertiesCopyWithImpl<$Res,
        _$_NotionDbHiringJobOfferProperties>
    implements _$$_NotionDbHiringJobOfferPropertiesCopyWith<$Res> {
  __$$_NotionDbHiringJobOfferPropertiesCopyWithImpl(
      _$_NotionDbHiringJobOfferProperties _value,
      $Res Function(_$_NotionDbHiringJobOfferProperties) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? contratto = freezed,
    Object? seniority = freezed,
    Object? ral = freezed,
  }) {
    return _then(_$_NotionDbHiringJobOfferProperties(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      contratto: freezed == contratto
          ? _value.contratto
          : contratto // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      seniority: freezed == seniority
          ? _value.seniority
          : seniority // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
      ral: freezed == ral
          ? _value.ral
          : ral // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelect?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbHiringJobOfferProperties
    implements _NotionDbHiringJobOfferProperties {
  const _$_NotionDbHiringJobOfferProperties(
      {@JsonKey(name: 'Team') required this.team,
      @JsonKey(name: 'Contratto') required this.contratto,
      @JsonKey(name: 'Seniority') required this.seniority,
      @JsonKey(name: 'RAL') required this.ral});

  factory _$_NotionDbHiringJobOfferProperties.fromJson(
          Map<String, dynamic> json) =>
      _$$_NotionDbHiringJobOfferPropertiesFromJson(json);

  @override
  @JsonKey(name: 'Team')
  final NotionDbPropertySelect? team;
  @override
  @JsonKey(name: 'Contratto')
  final NotionDbPropertySelect? contratto;
  @override
  @JsonKey(name: 'Seniority')
  final NotionDbPropertySelect? seniority;
  @override
  @JsonKey(name: 'RAL')
  final NotionDbPropertySelect? ral;

  @override
  String toString() {
    return 'NotionDbHiringJobOfferProperties(team: $team, contratto: $contratto, seniority: $seniority, ral: $ral)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbHiringJobOfferPropertiesCopyWith<
          _$_NotionDbHiringJobOfferProperties>
      get copyWith => __$$_NotionDbHiringJobOfferPropertiesCopyWithImpl<
          _$_NotionDbHiringJobOfferProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbHiringJobOfferPropertiesToJson(
      this,
    );
  }
}

abstract class _NotionDbHiringJobOfferProperties
    implements NotionDbHiringJobOfferProperties {
  const factory _NotionDbHiringJobOfferProperties(
          {@JsonKey(name: 'Team')
              required final NotionDbPropertySelect? team,
          @JsonKey(name: 'Contratto')
              required final NotionDbPropertySelect? contratto,
          @JsonKey(name: 'Seniority')
              required final NotionDbPropertySelect? seniority,
          @JsonKey(name: 'RAL')
              required final NotionDbPropertySelect? ral}) =
      _$_NotionDbHiringJobOfferProperties;

  factory _NotionDbHiringJobOfferProperties.fromJson(
      Map<String, dynamic> json) = _$_NotionDbHiringJobOfferProperties.fromJson;

  @override
  @JsonKey(name: 'Team')
  NotionDbPropertySelect? get team;
  @override
  @JsonKey(name: 'Contratto')
  NotionDbPropertySelect? get contratto;
  @override
  @JsonKey(name: 'Seniority')
  NotionDbPropertySelect? get seniority;
  @override
  @JsonKey(name: 'RAL')
  NotionDbPropertySelect? get ral;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbHiringJobOfferPropertiesCopyWith<
          _$_NotionDbHiringJobOfferProperties>
      get copyWith => throw _privateConstructorUsedError;
}
