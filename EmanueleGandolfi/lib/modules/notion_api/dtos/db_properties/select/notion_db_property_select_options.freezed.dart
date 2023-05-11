// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_property_select_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbPropertySelectOptions _$NotionDbPropertySelectOptionsFromJson(
    Map<String, dynamic> json) {
  return _NotionDbPropertySelectOptions.fromJson(json);
}

/// @nodoc
mixin _$NotionDbPropertySelectOptions {
  List<NotionSelectOption> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbPropertySelectOptionsCopyWith<NotionDbPropertySelectOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbPropertySelectOptionsCopyWith<$Res> {
  factory $NotionDbPropertySelectOptionsCopyWith(
          NotionDbPropertySelectOptions value,
          $Res Function(NotionDbPropertySelectOptions) then) =
      _$NotionDbPropertySelectOptionsCopyWithImpl<$Res,
          NotionDbPropertySelectOptions>;
  @useResult
  $Res call({List<NotionSelectOption> options});
}

/// @nodoc
class _$NotionDbPropertySelectOptionsCopyWithImpl<$Res,
        $Val extends NotionDbPropertySelectOptions>
    implements $NotionDbPropertySelectOptionsCopyWith<$Res> {
  _$NotionDbPropertySelectOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<NotionSelectOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionDbPropertySelectOptionsCopyWith<$Res>
    implements $NotionDbPropertySelectOptionsCopyWith<$Res> {
  factory _$$_NotionDbPropertySelectOptionsCopyWith(
          _$_NotionDbPropertySelectOptions value,
          $Res Function(_$_NotionDbPropertySelectOptions) then) =
      __$$_NotionDbPropertySelectOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotionSelectOption> options});
}

/// @nodoc
class __$$_NotionDbPropertySelectOptionsCopyWithImpl<$Res>
    extends _$NotionDbPropertySelectOptionsCopyWithImpl<$Res,
        _$_NotionDbPropertySelectOptions>
    implements _$$_NotionDbPropertySelectOptionsCopyWith<$Res> {
  __$$_NotionDbPropertySelectOptionsCopyWithImpl(
      _$_NotionDbPropertySelectOptions _value,
      $Res Function(_$_NotionDbPropertySelectOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = null,
  }) {
    return _then(_$_NotionDbPropertySelectOptions(
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<NotionSelectOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbPropertySelectOptions
    implements _NotionDbPropertySelectOptions {
  const _$_NotionDbPropertySelectOptions(
      {required final List<NotionSelectOption> options})
      : _options = options;

  factory _$_NotionDbPropertySelectOptions.fromJson(
          Map<String, dynamic> json) =>
      _$$_NotionDbPropertySelectOptionsFromJson(json);

  final List<NotionSelectOption> _options;
  @override
  List<NotionSelectOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'NotionDbPropertySelectOptions(options: $options)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbPropertySelectOptionsCopyWith<_$_NotionDbPropertySelectOptions>
      get copyWith => __$$_NotionDbPropertySelectOptionsCopyWithImpl<
          _$_NotionDbPropertySelectOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbPropertySelectOptionsToJson(
      this,
    );
  }
}

abstract class _NotionDbPropertySelectOptions
    implements NotionDbPropertySelectOptions {
  const factory _NotionDbPropertySelectOptions(
          {required final List<NotionSelectOption> options}) =
      _$_NotionDbPropertySelectOptions;

  factory _NotionDbPropertySelectOptions.fromJson(Map<String, dynamic> json) =
      _$_NotionDbPropertySelectOptions.fromJson;

  @override
  List<NotionSelectOption> get options;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbPropertySelectOptionsCopyWith<_$_NotionDbPropertySelectOptions>
      get copyWith => throw _privateConstructorUsedError;
}
