// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelance_job_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreelanceJobOffer {
  String get id => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime? get jobPosted => throw _privateConstructorUsedError;
  List<StyledText>? get tempistiche => throw _privateConstructorUsedError;
  List<StyledText>? get comeCandidarsi => throw _privateConstructorUsedError;
  List<StyledText>? get richiestaDiLavoro => throw _privateConstructorUsedError;
  List<StyledText>? get budget => throw _privateConstructorUsedError;
  SelectOption? get nda => throw _privateConstructorUsedError;
  List<StyledText>? get codice => throw _privateConstructorUsedError;
  List<StyledText>? get tempisticheDiPagamento =>
      throw _privateConstructorUsedError;
  List<StyledText>? get descrizioneDelProgetto =>
      throw _privateConstructorUsedError;
  SelectOption? get tipoDiRelazione => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreelanceJobOfferCopyWith<FreelanceJobOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreelanceJobOfferCopyWith<$Res> {
  factory $FreelanceJobOfferCopyWith(
          FreelanceJobOffer value, $Res Function(FreelanceJobOffer) then) =
      _$FreelanceJobOfferCopyWithImpl<$Res, FreelanceJobOffer>;
  @useResult
  $Res call(
      {String id,
      bool archived,
      String? emoji,
      String url,
      DateTime? jobPosted,
      List<StyledText>? tempistiche,
      List<StyledText>? comeCandidarsi,
      List<StyledText>? richiestaDiLavoro,
      List<StyledText>? budget,
      SelectOption? nda,
      List<StyledText>? codice,
      List<StyledText>? tempisticheDiPagamento,
      List<StyledText>? descrizioneDelProgetto,
      SelectOption? tipoDiRelazione});

  $SelectOptionCopyWith<$Res>? get nda;
  $SelectOptionCopyWith<$Res>? get tipoDiRelazione;
}

/// @nodoc
class _$FreelanceJobOfferCopyWithImpl<$Res, $Val extends FreelanceJobOffer>
    implements $FreelanceJobOfferCopyWith<$Res> {
  _$FreelanceJobOfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? archived = null,
    Object? emoji = freezed,
    Object? url = null,
    Object? jobPosted = freezed,
    Object? tempistiche = freezed,
    Object? comeCandidarsi = freezed,
    Object? richiestaDiLavoro = freezed,
    Object? budget = freezed,
    Object? nda = freezed,
    Object? codice = freezed,
    Object? tempisticheDiPagamento = freezed,
    Object? descrizioneDelProgetto = freezed,
    Object? tipoDiRelazione = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      jobPosted: freezed == jobPosted
          ? _value.jobPosted
          : jobPosted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tempistiche: freezed == tempistiche
          ? _value.tempistiche
          : tempistiche // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      comeCandidarsi: freezed == comeCandidarsi
          ? _value.comeCandidarsi
          : comeCandidarsi // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      richiestaDiLavoro: freezed == richiestaDiLavoro
          ? _value.richiestaDiLavoro
          : richiestaDiLavoro // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      nda: freezed == nda
          ? _value.nda
          : nda // ignore: cast_nullable_to_non_nullable
              as SelectOption?,
      codice: freezed == codice
          ? _value.codice
          : codice // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      tempisticheDiPagamento: freezed == tempisticheDiPagamento
          ? _value.tempisticheDiPagamento
          : tempisticheDiPagamento // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      descrizioneDelProgetto: freezed == descrizioneDelProgetto
          ? _value.descrizioneDelProgetto
          : descrizioneDelProgetto // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      tipoDiRelazione: freezed == tipoDiRelazione
          ? _value.tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as SelectOption?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectOptionCopyWith<$Res>? get nda {
    if (_value.nda == null) {
      return null;
    }

    return $SelectOptionCopyWith<$Res>(_value.nda!, (value) {
      return _then(_value.copyWith(nda: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectOptionCopyWith<$Res>? get tipoDiRelazione {
    if (_value.tipoDiRelazione == null) {
      return null;
    }

    return $SelectOptionCopyWith<$Res>(_value.tipoDiRelazione!, (value) {
      return _then(_value.copyWith(tipoDiRelazione: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FreelanceJobOfferCopyWith<$Res>
    implements $FreelanceJobOfferCopyWith<$Res> {
  factory _$$_FreelanceJobOfferCopyWith(_$_FreelanceJobOffer value,
          $Res Function(_$_FreelanceJobOffer) then) =
      __$$_FreelanceJobOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool archived,
      String? emoji,
      String url,
      DateTime? jobPosted,
      List<StyledText>? tempistiche,
      List<StyledText>? comeCandidarsi,
      List<StyledText>? richiestaDiLavoro,
      List<StyledText>? budget,
      SelectOption? nda,
      List<StyledText>? codice,
      List<StyledText>? tempisticheDiPagamento,
      List<StyledText>? descrizioneDelProgetto,
      SelectOption? tipoDiRelazione});

  @override
  $SelectOptionCopyWith<$Res>? get nda;
  @override
  $SelectOptionCopyWith<$Res>? get tipoDiRelazione;
}

/// @nodoc
class __$$_FreelanceJobOfferCopyWithImpl<$Res>
    extends _$FreelanceJobOfferCopyWithImpl<$Res, _$_FreelanceJobOffer>
    implements _$$_FreelanceJobOfferCopyWith<$Res> {
  __$$_FreelanceJobOfferCopyWithImpl(
      _$_FreelanceJobOffer _value, $Res Function(_$_FreelanceJobOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? archived = null,
    Object? emoji = freezed,
    Object? url = null,
    Object? jobPosted = freezed,
    Object? tempistiche = freezed,
    Object? comeCandidarsi = freezed,
    Object? richiestaDiLavoro = freezed,
    Object? budget = freezed,
    Object? nda = freezed,
    Object? codice = freezed,
    Object? tempisticheDiPagamento = freezed,
    Object? descrizioneDelProgetto = freezed,
    Object? tipoDiRelazione = freezed,
  }) {
    return _then(_$_FreelanceJobOffer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      jobPosted: freezed == jobPosted
          ? _value.jobPosted
          : jobPosted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tempistiche: freezed == tempistiche
          ? _value._tempistiche
          : tempistiche // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      comeCandidarsi: freezed == comeCandidarsi
          ? _value._comeCandidarsi
          : comeCandidarsi // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      richiestaDiLavoro: freezed == richiestaDiLavoro
          ? _value._richiestaDiLavoro
          : richiestaDiLavoro // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      budget: freezed == budget
          ? _value._budget
          : budget // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      nda: freezed == nda
          ? _value.nda
          : nda // ignore: cast_nullable_to_non_nullable
              as SelectOption?,
      codice: freezed == codice
          ? _value._codice
          : codice // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      tempisticheDiPagamento: freezed == tempisticheDiPagamento
          ? _value._tempisticheDiPagamento
          : tempisticheDiPagamento // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      descrizioneDelProgetto: freezed == descrizioneDelProgetto
          ? _value._descrizioneDelProgetto
          : descrizioneDelProgetto // ignore: cast_nullable_to_non_nullable
              as List<StyledText>?,
      tipoDiRelazione: freezed == tipoDiRelazione
          ? _value.tipoDiRelazione
          : tipoDiRelazione // ignore: cast_nullable_to_non_nullable
              as SelectOption?,
    ));
  }
}

/// @nodoc

class _$_FreelanceJobOffer implements _FreelanceJobOffer {
  const _$_FreelanceJobOffer(
      {required this.id,
      required this.archived,
      required this.emoji,
      required this.url,
      required this.jobPosted,
      required final List<StyledText>? tempistiche,
      required final List<StyledText>? comeCandidarsi,
      required final List<StyledText>? richiestaDiLavoro,
      required final List<StyledText>? budget,
      required this.nda,
      required final List<StyledText>? codice,
      required final List<StyledText>? tempisticheDiPagamento,
      required final List<StyledText>? descrizioneDelProgetto,
      required this.tipoDiRelazione})
      : _tempistiche = tempistiche,
        _comeCandidarsi = comeCandidarsi,
        _richiestaDiLavoro = richiestaDiLavoro,
        _budget = budget,
        _codice = codice,
        _tempisticheDiPagamento = tempisticheDiPagamento,
        _descrizioneDelProgetto = descrizioneDelProgetto;

  @override
  final String id;
  @override
  final bool archived;
  @override
  final String? emoji;
  @override
  final String url;
  @override
  final DateTime? jobPosted;
  final List<StyledText>? _tempistiche;
  @override
  List<StyledText>? get tempistiche {
    final value = _tempistiche;
    if (value == null) return null;
    if (_tempistiche is EqualUnmodifiableListView) return _tempistiche;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StyledText>? _comeCandidarsi;
  @override
  List<StyledText>? get comeCandidarsi {
    final value = _comeCandidarsi;
    if (value == null) return null;
    if (_comeCandidarsi is EqualUnmodifiableListView) return _comeCandidarsi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StyledText>? _richiestaDiLavoro;
  @override
  List<StyledText>? get richiestaDiLavoro {
    final value = _richiestaDiLavoro;
    if (value == null) return null;
    if (_richiestaDiLavoro is EqualUnmodifiableListView)
      return _richiestaDiLavoro;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StyledText>? _budget;
  @override
  List<StyledText>? get budget {
    final value = _budget;
    if (value == null) return null;
    if (_budget is EqualUnmodifiableListView) return _budget;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SelectOption? nda;
  final List<StyledText>? _codice;
  @override
  List<StyledText>? get codice {
    final value = _codice;
    if (value == null) return null;
    if (_codice is EqualUnmodifiableListView) return _codice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StyledText>? _tempisticheDiPagamento;
  @override
  List<StyledText>? get tempisticheDiPagamento {
    final value = _tempisticheDiPagamento;
    if (value == null) return null;
    if (_tempisticheDiPagamento is EqualUnmodifiableListView)
      return _tempisticheDiPagamento;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StyledText>? _descrizioneDelProgetto;
  @override
  List<StyledText>? get descrizioneDelProgetto {
    final value = _descrizioneDelProgetto;
    if (value == null) return null;
    if (_descrizioneDelProgetto is EqualUnmodifiableListView)
      return _descrizioneDelProgetto;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SelectOption? tipoDiRelazione;

  @override
  String toString() {
    return 'FreelanceJobOffer(id: $id, archived: $archived, emoji: $emoji, url: $url, jobPosted: $jobPosted, tempistiche: $tempistiche, comeCandidarsi: $comeCandidarsi, richiestaDiLavoro: $richiestaDiLavoro, budget: $budget, nda: $nda, codice: $codice, tempisticheDiPagamento: $tempisticheDiPagamento, descrizioneDelProgetto: $descrizioneDelProgetto, tipoDiRelazione: $tipoDiRelazione)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreelanceJobOfferCopyWith<_$_FreelanceJobOffer> get copyWith =>
      __$$_FreelanceJobOfferCopyWithImpl<_$_FreelanceJobOffer>(
          this, _$identity);
}

abstract class _FreelanceJobOffer implements FreelanceJobOffer {
  const factory _FreelanceJobOffer(
      {required final String id,
      required final bool archived,
      required final String? emoji,
      required final String url,
      required final DateTime? jobPosted,
      required final List<StyledText>? tempistiche,
      required final List<StyledText>? comeCandidarsi,
      required final List<StyledText>? richiestaDiLavoro,
      required final List<StyledText>? budget,
      required final SelectOption? nda,
      required final List<StyledText>? codice,
      required final List<StyledText>? tempisticheDiPagamento,
      required final List<StyledText>? descrizioneDelProgetto,
      required final SelectOption? tipoDiRelazione}) = _$_FreelanceJobOffer;

  @override
  String get id;
  @override
  bool get archived;
  @override
  String? get emoji;
  @override
  String get url;
  @override
  DateTime? get jobPosted;
  @override
  List<StyledText>? get tempistiche;
  @override
  List<StyledText>? get comeCandidarsi;
  @override
  List<StyledText>? get richiestaDiLavoro;
  @override
  List<StyledText>? get budget;
  @override
  SelectOption? get nda;
  @override
  List<StyledText>? get codice;
  @override
  List<StyledText>? get tempisticheDiPagamento;
  @override
  List<StyledText>? get descrizioneDelProgetto;
  @override
  SelectOption? get tipoDiRelazione;
  @override
  @JsonKey(ignore: true)
  _$$_FreelanceJobOfferCopyWith<_$_FreelanceJobOffer> get copyWith =>
      throw _privateConstructorUsedError;
}
