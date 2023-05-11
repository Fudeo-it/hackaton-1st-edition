// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelance_job_offer_list_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreelanceJobOfferListScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreelanceJobOfferListScreenEventCopyWith<$Res> {
  factory $FreelanceJobOfferListScreenEventCopyWith(
          FreelanceJobOfferListScreenEvent value,
          $Res Function(FreelanceJobOfferListScreenEvent) then) =
      _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
          FreelanceJobOfferListScreenEvent>;
}

/// @nodoc
class _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        $Val extends FreelanceJobOfferListScreenEvent>
    implements $FreelanceJobOfferListScreenEventCopyWith<$Res> {
  _$FreelanceJobOfferListScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PageRequestedCopyWith<$Res> {
  factory _$$_PageRequestedCopyWith(
          _$_PageRequested value, $Res Function(_$_PageRequested) then) =
      __$$_PageRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? pageKey});
}

/// @nodoc
class __$$_PageRequestedCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        _$_PageRequested> implements _$$_PageRequestedCopyWith<$Res> {
  __$$_PageRequestedCopyWithImpl(
      _$_PageRequested _value, $Res Function(_$_PageRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = freezed,
  }) {
    return _then(_$_PageRequested(
      freezed == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PageRequested implements _PageRequested {
  const _$_PageRequested(this.pageKey);

  @override
  final String? pageKey;

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenEvent.pageRequested(pageKey: $pageKey)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageRequestedCopyWith<_$_PageRequested> get copyWith =>
      __$$_PageRequestedCopyWithImpl<_$_PageRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) {
    return pageRequested(pageKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return pageRequested?.call(pageKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (pageRequested != null) {
      return pageRequested(pageKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) {
    return pageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return pageRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (pageRequested != null) {
      return pageRequested(this);
    }
    return orElse();
  }
}

abstract class _PageRequested implements FreelanceJobOfferListScreenEvent {
  const factory _PageRequested(final String? pageKey) = _$_PageRequested;

  String? get pageKey;
  @JsonKey(ignore: true)
  _$$_PageRequestedCopyWith<_$_PageRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshRequestedCopyWith<$Res> {
  factory _$$_RefreshRequestedCopyWith(
          _$_RefreshRequested value, $Res Function(_$_RefreshRequested) then) =
      __$$_RefreshRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshRequestedCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        _$_RefreshRequested> implements _$$_RefreshRequestedCopyWith<$Res> {
  __$$_RefreshRequestedCopyWithImpl(
      _$_RefreshRequested _value, $Res Function(_$_RefreshRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshRequested implements _RefreshRequested {
  const _$_RefreshRequested();

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenEvent.refreshRequested()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) {
    return refreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return refreshRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(this);
    }
    return orElse();
  }
}

abstract class _RefreshRequested implements FreelanceJobOfferListScreenEvent {
  const factory _RefreshRequested() = _$_RefreshRequested;
}

/// @nodoc
abstract class _$$_SearchQueryChangedCopyWith<$Res> {
  factory _$$_SearchQueryChangedCopyWith(_$_SearchQueryChanged value,
          $Res Function(_$_SearchQueryChanged) then) =
      __$$_SearchQueryChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchQuery});
}

/// @nodoc
class __$$_SearchQueryChangedCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        _$_SearchQueryChanged> implements _$$_SearchQueryChangedCopyWith<$Res> {
  __$$_SearchQueryChangedCopyWithImpl(
      _$_SearchQueryChanged _value, $Res Function(_$_SearchQueryChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
  }) {
    return _then(_$_SearchQueryChanged(
      null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchQueryChanged implements _SearchQueryChanged {
  const _$_SearchQueryChanged(this.searchQuery);

  @override
  final String searchQuery;

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenEvent.searchQueryChanged(searchQuery: $searchQuery)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchQueryChangedCopyWith<_$_SearchQueryChanged> get copyWith =>
      __$$_SearchQueryChangedCopyWithImpl<_$_SearchQueryChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) {
    return searchQueryChanged(searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return searchQueryChanged?.call(searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (searchQueryChanged != null) {
      return searchQueryChanged(searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) {
    return searchQueryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return searchQueryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (searchQueryChanged != null) {
      return searchQueryChanged(this);
    }
    return orElse();
  }
}

abstract class _SearchQueryChanged implements FreelanceJobOfferListScreenEvent {
  const factory _SearchQueryChanged(final String searchQuery) =
      _$_SearchQueryChanged;

  String get searchQuery;
  @JsonKey(ignore: true)
  _$$_SearchQueryChangedCopyWith<_$_SearchQueryChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FiltersChangedCopyWith<$Res> {
  factory _$$_FiltersChangedCopyWith(
          _$_FiltersChanged value, $Res Function(_$_FiltersChanged) then) =
      __$$_FiltersChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({FreelanceJobOfferFilters filters});

  $FreelanceJobOfferFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$_FiltersChangedCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        _$_FiltersChanged> implements _$$_FiltersChangedCopyWith<$Res> {
  __$$_FiltersChangedCopyWithImpl(
      _$_FiltersChanged _value, $Res Function(_$_FiltersChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
  }) {
    return _then(_$_FiltersChanged(
      null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FreelanceJobOfferFilters,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FreelanceJobOfferFiltersCopyWith<$Res> get filters {
    return $FreelanceJobOfferFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc

class _$_FiltersChanged implements _FiltersChanged {
  const _$_FiltersChanged(this.filters);

  @override
  final FreelanceJobOfferFilters filters;

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenEvent.filtersChanged(filters: $filters)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FiltersChangedCopyWith<_$_FiltersChanged> get copyWith =>
      __$$_FiltersChangedCopyWithImpl<_$_FiltersChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) {
    return filtersChanged(filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return filtersChanged?.call(filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (filtersChanged != null) {
      return filtersChanged(filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) {
    return filtersChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return filtersChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (filtersChanged != null) {
      return filtersChanged(this);
    }
    return orElse();
  }
}

abstract class _FiltersChanged implements FreelanceJobOfferListScreenEvent {
  const factory _FiltersChanged(final FreelanceJobOfferFilters filters) =
      _$_FiltersChanged;

  FreelanceJobOfferFilters get filters;
  @JsonKey(ignore: true)
  _$$_FiltersChangedCopyWith<_$_FiltersChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FavoriteFreelanceJobOfferToggledCopyWith<$Res> {
  factory _$$_FavoriteFreelanceJobOfferToggledCopyWith(
          _$_FavoriteFreelanceJobOfferToggled value,
          $Res Function(_$_FavoriteFreelanceJobOfferToggled) then) =
      __$$_FavoriteFreelanceJobOfferToggledCopyWithImpl<$Res>;
  @useResult
  $Res call({String freelanceJobOfferId});
}

/// @nodoc
class __$$_FavoriteFreelanceJobOfferToggledCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        _$_FavoriteFreelanceJobOfferToggled>
    implements _$$_FavoriteFreelanceJobOfferToggledCopyWith<$Res> {
  __$$_FavoriteFreelanceJobOfferToggledCopyWithImpl(
      _$_FavoriteFreelanceJobOfferToggled _value,
      $Res Function(_$_FavoriteFreelanceJobOfferToggled) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freelanceJobOfferId = null,
  }) {
    return _then(_$_FavoriteFreelanceJobOfferToggled(
      null == freelanceJobOfferId
          ? _value.freelanceJobOfferId
          : freelanceJobOfferId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FavoriteFreelanceJobOfferToggled
    implements _FavoriteFreelanceJobOfferToggled {
  const _$_FavoriteFreelanceJobOfferToggled(this.freelanceJobOfferId);

  @override
  final String freelanceJobOfferId;

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenEvent.favoriteFreelanceJobOfferToggled(freelanceJobOfferId: $freelanceJobOfferId)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteFreelanceJobOfferToggledCopyWith<
          _$_FavoriteFreelanceJobOfferToggled>
      get copyWith => __$$_FavoriteFreelanceJobOfferToggledCopyWithImpl<
          _$_FavoriteFreelanceJobOfferToggled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOfferToggled(freelanceJobOfferId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOfferToggled?.call(freelanceJobOfferId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (favoriteFreelanceJobOfferToggled != null) {
      return favoriteFreelanceJobOfferToggled(freelanceJobOfferId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOfferToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOfferToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (favoriteFreelanceJobOfferToggled != null) {
      return favoriteFreelanceJobOfferToggled(this);
    }
    return orElse();
  }
}

abstract class _FavoriteFreelanceJobOfferToggled
    implements FreelanceJobOfferListScreenEvent {
  const factory _FavoriteFreelanceJobOfferToggled(
      final String freelanceJobOfferId) = _$_FavoriteFreelanceJobOfferToggled;

  String get freelanceJobOfferId;
  @JsonKey(ignore: true)
  _$$_FavoriteFreelanceJobOfferToggledCopyWith<
          _$_FavoriteFreelanceJobOfferToggled>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FavoriteFreelanceJobOffersChangedCopyWith<$Res> {
  factory _$$_FavoriteFreelanceJobOffersChangedCopyWith(
          _$_FavoriteFreelanceJobOffersChanged value,
          $Res Function(_$_FavoriteFreelanceJobOffersChanged) then) =
      __$$_FavoriteFreelanceJobOffersChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> favoriteFreelanceJobOffersIds});
}

/// @nodoc
class __$$_FavoriteFreelanceJobOffersChangedCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenEventCopyWithImpl<$Res,
        _$_FavoriteFreelanceJobOffersChanged>
    implements _$$_FavoriteFreelanceJobOffersChangedCopyWith<$Res> {
  __$$_FavoriteFreelanceJobOffersChangedCopyWithImpl(
      _$_FavoriteFreelanceJobOffersChanged _value,
      $Res Function(_$_FavoriteFreelanceJobOffersChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteFreelanceJobOffersIds = null,
  }) {
    return _then(_$_FavoriteFreelanceJobOffersChanged(
      null == favoriteFreelanceJobOffersIds
          ? _value._favoriteFreelanceJobOffersIds
          : favoriteFreelanceJobOffersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FavoriteFreelanceJobOffersChanged
    implements _FavoriteFreelanceJobOffersChanged {
  const _$_FavoriteFreelanceJobOffersChanged(
      final List<String> favoriteFreelanceJobOffersIds)
      : _favoriteFreelanceJobOffersIds = favoriteFreelanceJobOffersIds;

  final List<String> _favoriteFreelanceJobOffersIds;
  @override
  List<String> get favoriteFreelanceJobOffersIds {
    if (_favoriteFreelanceJobOffersIds is EqualUnmodifiableListView)
      return _favoriteFreelanceJobOffersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteFreelanceJobOffersIds);
  }

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenEvent.favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds: $favoriteFreelanceJobOffersIds)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteFreelanceJobOffersChangedCopyWith<
          _$_FavoriteFreelanceJobOffersChanged>
      get copyWith => __$$_FavoriteFreelanceJobOffersChangedCopyWithImpl<
          _$_FavoriteFreelanceJobOffersChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? pageKey) pageRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String searchQuery) searchQueryChanged,
    required TResult Function(FreelanceJobOfferFilters filters) filtersChanged,
    required TResult Function(String freelanceJobOfferId)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(List<String> favoriteFreelanceJobOffersIds)
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? pageKey)? pageRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String searchQuery)? searchQueryChanged,
    TResult? Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult? Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOffersChanged
        ?.call(favoriteFreelanceJobOffersIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? pageKey)? pageRequested,
    TResult Function()? refreshRequested,
    TResult Function(String searchQuery)? searchQueryChanged,
    TResult Function(FreelanceJobOfferFilters filters)? filtersChanged,
    TResult Function(String freelanceJobOfferId)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(List<String> favoriteFreelanceJobOffersIds)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (favoriteFreelanceJobOffersChanged != null) {
      return favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageRequested value) pageRequested,
    required TResult Function(_RefreshRequested value) refreshRequested,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_FavoriteFreelanceJobOfferToggled value)
        favoriteFreelanceJobOfferToggled,
    required TResult Function(_FavoriteFreelanceJobOffersChanged value)
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOffersChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageRequested value)? pageRequested,
    TResult? Function(_RefreshRequested value)? refreshRequested,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_FiltersChanged value)? filtersChanged,
    TResult? Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult? Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
  }) {
    return favoriteFreelanceJobOffersChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageRequested value)? pageRequested,
    TResult Function(_RefreshRequested value)? refreshRequested,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_FavoriteFreelanceJobOfferToggled value)?
        favoriteFreelanceJobOfferToggled,
    TResult Function(_FavoriteFreelanceJobOffersChanged value)?
        favoriteFreelanceJobOffersChanged,
    required TResult orElse(),
  }) {
    if (favoriteFreelanceJobOffersChanged != null) {
      return favoriteFreelanceJobOffersChanged(this);
    }
    return orElse();
  }
}

abstract class _FavoriteFreelanceJobOffersChanged
    implements FreelanceJobOfferListScreenEvent {
  const factory _FavoriteFreelanceJobOffersChanged(
          final List<String> favoriteFreelanceJobOffersIds) =
      _$_FavoriteFreelanceJobOffersChanged;

  List<String> get favoriteFreelanceJobOffersIds;
  @JsonKey(ignore: true)
  _$$_FavoriteFreelanceJobOffersChangedCopyWith<
          _$_FavoriteFreelanceJobOffersChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FreelanceJobOfferListScreenState {
  PagingState<String?, FreelanceJobOffer> get pagingState =>
      throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  FreelanceJobOfferFilters get filters => throw _privateConstructorUsedError;
  List<String> get favoriteFreelanceJobOfferIds =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreelanceJobOfferListScreenStateCopyWith<FreelanceJobOfferListScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreelanceJobOfferListScreenStateCopyWith<$Res> {
  factory $FreelanceJobOfferListScreenStateCopyWith(
          FreelanceJobOfferListScreenState value,
          $Res Function(FreelanceJobOfferListScreenState) then) =
      _$FreelanceJobOfferListScreenStateCopyWithImpl<$Res,
          FreelanceJobOfferListScreenState>;
  @useResult
  $Res call(
      {PagingState<String?, FreelanceJobOffer> pagingState,
      String searchQuery,
      FreelanceJobOfferFilters filters,
      List<String> favoriteFreelanceJobOfferIds});

  $FreelanceJobOfferFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$FreelanceJobOfferListScreenStateCopyWithImpl<$Res,
        $Val extends FreelanceJobOfferListScreenState>
    implements $FreelanceJobOfferListScreenStateCopyWith<$Res> {
  _$FreelanceJobOfferListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? searchQuery = null,
    Object? filters = null,
    Object? favoriteFreelanceJobOfferIds = null,
  }) {
    return _then(_value.copyWith(
      pagingState: null == pagingState
          ? _value.pagingState
          : pagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<String?, FreelanceJobOffer>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FreelanceJobOfferFilters,
      favoriteFreelanceJobOfferIds: null == favoriteFreelanceJobOfferIds
          ? _value.favoriteFreelanceJobOfferIds
          : favoriteFreelanceJobOfferIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FreelanceJobOfferFiltersCopyWith<$Res> get filters {
    return $FreelanceJobOfferFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FreelanceJobOfferListScreenStateCopyWith<$Res>
    implements $FreelanceJobOfferListScreenStateCopyWith<$Res> {
  factory _$$_FreelanceJobOfferListScreenStateCopyWith(
          _$_FreelanceJobOfferListScreenState value,
          $Res Function(_$_FreelanceJobOfferListScreenState) then) =
      __$$_FreelanceJobOfferListScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PagingState<String?, FreelanceJobOffer> pagingState,
      String searchQuery,
      FreelanceJobOfferFilters filters,
      List<String> favoriteFreelanceJobOfferIds});

  @override
  $FreelanceJobOfferFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$_FreelanceJobOfferListScreenStateCopyWithImpl<$Res>
    extends _$FreelanceJobOfferListScreenStateCopyWithImpl<$Res,
        _$_FreelanceJobOfferListScreenState>
    implements _$$_FreelanceJobOfferListScreenStateCopyWith<$Res> {
  __$$_FreelanceJobOfferListScreenStateCopyWithImpl(
      _$_FreelanceJobOfferListScreenState _value,
      $Res Function(_$_FreelanceJobOfferListScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? searchQuery = null,
    Object? filters = null,
    Object? favoriteFreelanceJobOfferIds = null,
  }) {
    return _then(_$_FreelanceJobOfferListScreenState(
      pagingState: null == pagingState
          ? _value.pagingState
          : pagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<String?, FreelanceJobOffer>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FreelanceJobOfferFilters,
      favoriteFreelanceJobOfferIds: null == favoriteFreelanceJobOfferIds
          ? _value._favoriteFreelanceJobOfferIds
          : favoriteFreelanceJobOfferIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FreelanceJobOfferListScreenState
    implements _FreelanceJobOfferListScreenState {
  const _$_FreelanceJobOfferListScreenState(
      {this.pagingState = const PagingState(),
      this.searchQuery = '',
      this.filters = const FreelanceJobOfferFilters(),
      final List<String> favoriteFreelanceJobOfferIds = const []})
      : _favoriteFreelanceJobOfferIds = favoriteFreelanceJobOfferIds;

  @override
  @JsonKey()
  final PagingState<String?, FreelanceJobOffer> pagingState;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final FreelanceJobOfferFilters filters;
  final List<String> _favoriteFreelanceJobOfferIds;
  @override
  @JsonKey()
  List<String> get favoriteFreelanceJobOfferIds {
    if (_favoriteFreelanceJobOfferIds is EqualUnmodifiableListView)
      return _favoriteFreelanceJobOfferIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteFreelanceJobOfferIds);
  }

  @override
  String toString() {
    return 'FreelanceJobOfferListScreenState(pagingState: $pagingState, searchQuery: $searchQuery, filters: $filters, favoriteFreelanceJobOfferIds: $favoriteFreelanceJobOfferIds)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreelanceJobOfferListScreenStateCopyWith<
          _$_FreelanceJobOfferListScreenState>
      get copyWith => __$$_FreelanceJobOfferListScreenStateCopyWithImpl<
          _$_FreelanceJobOfferListScreenState>(this, _$identity);
}

abstract class _FreelanceJobOfferListScreenState
    implements FreelanceJobOfferListScreenState {
  const factory _FreelanceJobOfferListScreenState(
          {final PagingState<String?, FreelanceJobOffer> pagingState,
          final String searchQuery,
          final FreelanceJobOfferFilters filters,
          final List<String> favoriteFreelanceJobOfferIds}) =
      _$_FreelanceJobOfferListScreenState;

  @override
  PagingState<String?, FreelanceJobOffer> get pagingState;
  @override
  String get searchQuery;
  @override
  FreelanceJobOfferFilters get filters;
  @override
  List<String> get favoriteFreelanceJobOfferIds;
  @override
  @JsonKey(ignore: true)
  _$$_FreelanceJobOfferListScreenStateCopyWith<
          _$_FreelanceJobOfferListScreenState>
      get copyWith => throw _privateConstructorUsedError;
}
