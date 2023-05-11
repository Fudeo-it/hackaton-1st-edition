// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionFilter _$NotionFilterFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'select':
      return NotionFilterSelect.fromJson(json);
    case 'richText':
      return NotionFilterRichText.fromJson(json);
    case 'and':
      return NotionFilterAnd.fromJson(json);
    case 'or':
      return NotionFilterOr.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NotionFilter',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotionFilter {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)
        select,
    required TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)
        richText,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> and)
        and,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> or)
        or,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult? Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> or)? or,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult Function(@NotionFilterConverter() List<NotionFilter> or)? or,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterSelect value) select,
    required TResult Function(NotionFilterRichText value) richText,
    required TResult Function(NotionFilterAnd value) and,
    required TResult Function(NotionFilterOr value) or,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterSelect value)? select,
    TResult? Function(NotionFilterRichText value)? richText,
    TResult? Function(NotionFilterAnd value)? and,
    TResult? Function(NotionFilterOr value)? or,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterSelect value)? select,
    TResult Function(NotionFilterRichText value)? richText,
    TResult Function(NotionFilterAnd value)? and,
    TResult Function(NotionFilterOr value)? or,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionFilterCopyWith<$Res> {
  factory $NotionFilterCopyWith(
          NotionFilter value, $Res Function(NotionFilter) then) =
      _$NotionFilterCopyWithImpl<$Res, NotionFilter>;
}

/// @nodoc
class _$NotionFilterCopyWithImpl<$Res, $Val extends NotionFilter>
    implements $NotionFilterCopyWith<$Res> {
  _$NotionFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotionFilterSelectCopyWith<$Res> {
  factory _$$NotionFilterSelectCopyWith(_$NotionFilterSelect value,
          $Res Function(_$NotionFilterSelect) then) =
      __$$NotionFilterSelectCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String property,
      @NotionFilterConditionConverter() NotionFilterCondition select});

  $NotionFilterConditionCopyWith<$Res> get select;
}

/// @nodoc
class __$$NotionFilterSelectCopyWithImpl<$Res>
    extends _$NotionFilterCopyWithImpl<$Res, _$NotionFilterSelect>
    implements _$$NotionFilterSelectCopyWith<$Res> {
  __$$NotionFilterSelectCopyWithImpl(
      _$NotionFilterSelect _value, $Res Function(_$NotionFilterSelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
    Object? select = null,
  }) {
    return _then(_$NotionFilterSelect(
      null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
      null == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as NotionFilterCondition,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionFilterConditionCopyWith<$Res> get select {
    return $NotionFilterConditionCopyWith<$Res>(_value.select, (value) {
      return _then(_value.copyWith(select: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionFilterSelect implements NotionFilterSelect {
  const _$NotionFilterSelect(
      this.property, @NotionFilterConditionConverter() this.select,
      {final String? $type})
      : $type = $type ?? 'select';

  factory _$NotionFilterSelect.fromJson(Map<String, dynamic> json) =>
      _$$NotionFilterSelectFromJson(json);

  @override
  final String property;
  @override
  @NotionFilterConditionConverter()
  final NotionFilterCondition select;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotionFilter.select(property: $property, select: $select)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionFilterSelectCopyWith<_$NotionFilterSelect> get copyWith =>
      __$$NotionFilterSelectCopyWithImpl<_$NotionFilterSelect>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)
        select,
    required TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)
        richText,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> and)
        and,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> or)
        or,
  }) {
    return select(property, this.select);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult? Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> or)? or,
  }) {
    return select?.call(property, this.select);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult Function(@NotionFilterConverter() List<NotionFilter> or)? or,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(property, this.select);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterSelect value) select,
    required TResult Function(NotionFilterRichText value) richText,
    required TResult Function(NotionFilterAnd value) and,
    required TResult Function(NotionFilterOr value) or,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterSelect value)? select,
    TResult? Function(NotionFilterRichText value)? richText,
    TResult? Function(NotionFilterAnd value)? and,
    TResult? Function(NotionFilterOr value)? or,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterSelect value)? select,
    TResult Function(NotionFilterRichText value)? richText,
    TResult Function(NotionFilterAnd value)? and,
    TResult Function(NotionFilterOr value)? or,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionFilterSelectToJson(
      this,
    );
  }
}

abstract class NotionFilterSelect implements NotionFilter {
  const factory NotionFilterSelect(
      final String property,
      @NotionFilterConditionConverter()
          final NotionFilterCondition select) = _$NotionFilterSelect;

  factory NotionFilterSelect.fromJson(Map<String, dynamic> json) =
      _$NotionFilterSelect.fromJson;

  String get property;
  @NotionFilterConditionConverter()
  NotionFilterCondition get select;
  @JsonKey(ignore: true)
  _$$NotionFilterSelectCopyWith<_$NotionFilterSelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionFilterRichTextCopyWith<$Res> {
  factory _$$NotionFilterRichTextCopyWith(_$NotionFilterRichText value,
          $Res Function(_$NotionFilterRichText) then) =
      __$$NotionFilterRichTextCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String property,
      @JsonKey(name: 'rich_text')
      @NotionFilterConditionConverter()
          NotionFilterCondition richText});

  $NotionFilterConditionCopyWith<$Res> get richText;
}

/// @nodoc
class __$$NotionFilterRichTextCopyWithImpl<$Res>
    extends _$NotionFilterCopyWithImpl<$Res, _$NotionFilterRichText>
    implements _$$NotionFilterRichTextCopyWith<$Res> {
  __$$NotionFilterRichTextCopyWithImpl(_$NotionFilterRichText _value,
      $Res Function(_$NotionFilterRichText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
    Object? richText = null,
  }) {
    return _then(_$NotionFilterRichText(
      null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
      null == richText
          ? _value.richText
          : richText // ignore: cast_nullable_to_non_nullable
              as NotionFilterCondition,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionFilterConditionCopyWith<$Res> get richText {
    return $NotionFilterConditionCopyWith<$Res>(_value.richText, (value) {
      return _then(_value.copyWith(richText: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionFilterRichText implements NotionFilterRichText {
  const _$NotionFilterRichText(
      this.property,
      @JsonKey(name: 'rich_text')
      @NotionFilterConditionConverter()
          this.richText,
      {final String? $type})
      : $type = $type ?? 'richText';

  factory _$NotionFilterRichText.fromJson(Map<String, dynamic> json) =>
      _$$NotionFilterRichTextFromJson(json);

  @override
  final String property;
  @override
  @JsonKey(name: 'rich_text')
  @NotionFilterConditionConverter()
  final NotionFilterCondition richText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotionFilter.richText(property: $property, richText: $richText)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionFilterRichTextCopyWith<_$NotionFilterRichText> get copyWith =>
      __$$NotionFilterRichTextCopyWithImpl<_$NotionFilterRichText>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)
        select,
    required TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)
        richText,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> and)
        and,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> or)
        or,
  }) {
    return richText(property, this.richText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult? Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> or)? or,
  }) {
    return richText?.call(property, this.richText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult Function(@NotionFilterConverter() List<NotionFilter> or)? or,
    required TResult orElse(),
  }) {
    if (richText != null) {
      return richText(property, this.richText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterSelect value) select,
    required TResult Function(NotionFilterRichText value) richText,
    required TResult Function(NotionFilterAnd value) and,
    required TResult Function(NotionFilterOr value) or,
  }) {
    return richText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterSelect value)? select,
    TResult? Function(NotionFilterRichText value)? richText,
    TResult? Function(NotionFilterAnd value)? and,
    TResult? Function(NotionFilterOr value)? or,
  }) {
    return richText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterSelect value)? select,
    TResult Function(NotionFilterRichText value)? richText,
    TResult Function(NotionFilterAnd value)? and,
    TResult Function(NotionFilterOr value)? or,
    required TResult orElse(),
  }) {
    if (richText != null) {
      return richText(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionFilterRichTextToJson(
      this,
    );
  }
}

abstract class NotionFilterRichText implements NotionFilter {
  const factory NotionFilterRichText(
      final String property,
      @JsonKey(name: 'rich_text')
      @NotionFilterConditionConverter()
          final NotionFilterCondition richText) = _$NotionFilterRichText;

  factory NotionFilterRichText.fromJson(Map<String, dynamic> json) =
      _$NotionFilterRichText.fromJson;

  String get property;
  @JsonKey(name: 'rich_text')
  @NotionFilterConditionConverter()
  NotionFilterCondition get richText;
  @JsonKey(ignore: true)
  _$$NotionFilterRichTextCopyWith<_$NotionFilterRichText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionFilterAndCopyWith<$Res> {
  factory _$$NotionFilterAndCopyWith(
          _$NotionFilterAnd value, $Res Function(_$NotionFilterAnd) then) =
      __$$NotionFilterAndCopyWithImpl<$Res>;
  @useResult
  $Res call({@NotionFilterConverter() List<NotionFilter> and});
}

/// @nodoc
class __$$NotionFilterAndCopyWithImpl<$Res>
    extends _$NotionFilterCopyWithImpl<$Res, _$NotionFilterAnd>
    implements _$$NotionFilterAndCopyWith<$Res> {
  __$$NotionFilterAndCopyWithImpl(
      _$NotionFilterAnd _value, $Res Function(_$NotionFilterAnd) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? and = null,
  }) {
    return _then(_$NotionFilterAnd(
      null == and
          ? _value._and
          : and // ignore: cast_nullable_to_non_nullable
              as List<NotionFilter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionFilterAnd implements NotionFilterAnd {
  const _$NotionFilterAnd(@NotionFilterConverter() final List<NotionFilter> and,
      {final String? $type})
      : _and = and,
        $type = $type ?? 'and';

  factory _$NotionFilterAnd.fromJson(Map<String, dynamic> json) =>
      _$$NotionFilterAndFromJson(json);

  final List<NotionFilter> _and;
  @override
  @NotionFilterConverter()
  List<NotionFilter> get and {
    if (_and is EqualUnmodifiableListView) return _and;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_and);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotionFilter.and(and: $and)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionFilterAndCopyWith<_$NotionFilterAnd> get copyWith =>
      __$$NotionFilterAndCopyWithImpl<_$NotionFilterAnd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)
        select,
    required TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)
        richText,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> and)
        and,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> or)
        or,
  }) {
    return and(this.and);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult? Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> or)? or,
  }) {
    return and?.call(this.and);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult Function(@NotionFilterConverter() List<NotionFilter> or)? or,
    required TResult orElse(),
  }) {
    if (and != null) {
      return and(this.and);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterSelect value) select,
    required TResult Function(NotionFilterRichText value) richText,
    required TResult Function(NotionFilterAnd value) and,
    required TResult Function(NotionFilterOr value) or,
  }) {
    return and(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterSelect value)? select,
    TResult? Function(NotionFilterRichText value)? richText,
    TResult? Function(NotionFilterAnd value)? and,
    TResult? Function(NotionFilterOr value)? or,
  }) {
    return and?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterSelect value)? select,
    TResult Function(NotionFilterRichText value)? richText,
    TResult Function(NotionFilterAnd value)? and,
    TResult Function(NotionFilterOr value)? or,
    required TResult orElse(),
  }) {
    if (and != null) {
      return and(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionFilterAndToJson(
      this,
    );
  }
}

abstract class NotionFilterAnd implements NotionFilter {
  const factory NotionFilterAnd(
          @NotionFilterConverter() final List<NotionFilter> and) =
      _$NotionFilterAnd;

  factory NotionFilterAnd.fromJson(Map<String, dynamic> json) =
      _$NotionFilterAnd.fromJson;

  @NotionFilterConverter()
  List<NotionFilter> get and;
  @JsonKey(ignore: true)
  _$$NotionFilterAndCopyWith<_$NotionFilterAnd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionFilterOrCopyWith<$Res> {
  factory _$$NotionFilterOrCopyWith(
          _$NotionFilterOr value, $Res Function(_$NotionFilterOr) then) =
      __$$NotionFilterOrCopyWithImpl<$Res>;
  @useResult
  $Res call({@NotionFilterConverter() List<NotionFilter> or});
}

/// @nodoc
class __$$NotionFilterOrCopyWithImpl<$Res>
    extends _$NotionFilterCopyWithImpl<$Res, _$NotionFilterOr>
    implements _$$NotionFilterOrCopyWith<$Res> {
  __$$NotionFilterOrCopyWithImpl(
      _$NotionFilterOr _value, $Res Function(_$NotionFilterOr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? or = null,
  }) {
    return _then(_$NotionFilterOr(
      null == or
          ? _value._or
          : or // ignore: cast_nullable_to_non_nullable
              as List<NotionFilter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionFilterOr implements NotionFilterOr {
  const _$NotionFilterOr(@NotionFilterConverter() final List<NotionFilter> or,
      {final String? $type})
      : _or = or,
        $type = $type ?? 'or';

  factory _$NotionFilterOr.fromJson(Map<String, dynamic> json) =>
      _$$NotionFilterOrFromJson(json);

  final List<NotionFilter> _or;
  @override
  @NotionFilterConverter()
  List<NotionFilter> get or {
    if (_or is EqualUnmodifiableListView) return _or;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_or);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotionFilter.or(or: $or)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionFilterOrCopyWith<_$NotionFilterOr> get copyWith =>
      __$$NotionFilterOrCopyWithImpl<_$NotionFilterOr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)
        select,
    required TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)
        richText,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> and)
        and,
    required TResult Function(@NotionFilterConverter() List<NotionFilter> or)
        or,
  }) {
    return or(this.or);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult? Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult? Function(@NotionFilterConverter() List<NotionFilter> or)? or,
  }) {
    return or?.call(this.or);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String property,
            @NotionFilterConditionConverter() NotionFilterCondition select)?
        select,
    TResult Function(
            String property,
            @JsonKey(name: 'rich_text')
            @NotionFilterConditionConverter()
                NotionFilterCondition richText)?
        richText,
    TResult Function(@NotionFilterConverter() List<NotionFilter> and)? and,
    TResult Function(@NotionFilterConverter() List<NotionFilter> or)? or,
    required TResult orElse(),
  }) {
    if (or != null) {
      return or(this.or);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterSelect value) select,
    required TResult Function(NotionFilterRichText value) richText,
    required TResult Function(NotionFilterAnd value) and,
    required TResult Function(NotionFilterOr value) or,
  }) {
    return or(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterSelect value)? select,
    TResult? Function(NotionFilterRichText value)? richText,
    TResult? Function(NotionFilterAnd value)? and,
    TResult? Function(NotionFilterOr value)? or,
  }) {
    return or?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterSelect value)? select,
    TResult Function(NotionFilterRichText value)? richText,
    TResult Function(NotionFilterAnd value)? and,
    TResult Function(NotionFilterOr value)? or,
    required TResult orElse(),
  }) {
    if (or != null) {
      return or(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionFilterOrToJson(
      this,
    );
  }
}

abstract class NotionFilterOr implements NotionFilter {
  const factory NotionFilterOr(
      @NotionFilterConverter() final List<NotionFilter> or) = _$NotionFilterOr;

  factory NotionFilterOr.fromJson(Map<String, dynamic> json) =
      _$NotionFilterOr.fromJson;

  @NotionFilterConverter()
  List<NotionFilter> get or;
  @JsonKey(ignore: true)
  _$$NotionFilterOrCopyWith<_$NotionFilterOr> get copyWith =>
      throw _privateConstructorUsedError;
}
