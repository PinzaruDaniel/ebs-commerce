// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_response_api_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductResponseApiDto {

 int get count; int? get totalPages; int? get perPage; int? get currentPage; List<ProductApiDto> get results;
/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductResponseApiDtoCopyWith<ProductResponseApiDto> get copyWith => _$ProductResponseApiDtoCopyWithImpl<ProductResponseApiDto>(this as ProductResponseApiDto, _$identity);

  /// Serializes this ProductResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductResponseApiDto&&(identical(other.count, count) || other.count == count)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'ProductResponseApiDto(count: $count, totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, results: $results)';
}


}

/// @nodoc
abstract mixin class $ProductResponseApiDtoCopyWith<$Res>  {
  factory $ProductResponseApiDtoCopyWith(ProductResponseApiDto value, $Res Function(ProductResponseApiDto) _then) = _$ProductResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 int count, int? totalPages, int? perPage, int? currentPage, List<ProductApiDto> results
});




}
/// @nodoc
class _$ProductResponseApiDtoCopyWithImpl<$Res>
    implements $ProductResponseApiDtoCopyWith<$Res> {
  _$ProductResponseApiDtoCopyWithImpl(this._self, this._then);

  final ProductResponseApiDto _self;
  final $Res Function(ProductResponseApiDto) _then;

/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ProductApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductResponseApiDto].
extension ProductResponseApiDtoPatterns on ProductResponseApiDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductResponseApiDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int? totalPages,  int? perPage,  int? currentPage,  List<ProductApiDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int? totalPages,  int? perPage,  int? currentPage,  List<ProductApiDto> results)  $default,) {final _that = this;
switch (_that) {
case _ProductResponseApiDto():
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int? totalPages,  int? perPage,  int? currentPage,  List<ProductApiDto> results)?  $default,) {final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductResponseApiDto implements ProductResponseApiDto {
  const _ProductResponseApiDto({required this.count, required this.totalPages, required this.perPage, required this.currentPage, required final  List<ProductApiDto> results}): _results = results;
  factory _ProductResponseApiDto.fromJson(Map<String, dynamic> json) => _$ProductResponseApiDtoFromJson(json);

@override final  int count;
@override final  int? totalPages;
@override final  int? perPage;
@override final  int? currentPage;
 final  List<ProductApiDto> _results;
@override List<ProductApiDto> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductResponseApiDtoCopyWith<_ProductResponseApiDto> get copyWith => __$ProductResponseApiDtoCopyWithImpl<_ProductResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductResponseApiDto&&(identical(other.count, count) || other.count == count)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ProductResponseApiDto(count: $count, totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, results: $results)';
}


}

/// @nodoc
abstract mixin class _$ProductResponseApiDtoCopyWith<$Res> implements $ProductResponseApiDtoCopyWith<$Res> {
  factory _$ProductResponseApiDtoCopyWith(_ProductResponseApiDto value, $Res Function(_ProductResponseApiDto) _then) = __$ProductResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int count, int? totalPages, int? perPage, int? currentPage, List<ProductApiDto> results
});




}
/// @nodoc
class __$ProductResponseApiDtoCopyWithImpl<$Res>
    implements _$ProductResponseApiDtoCopyWith<$Res> {
  __$ProductResponseApiDtoCopyWithImpl(this._self, this._then);

  final _ProductResponseApiDto _self;
  final $Res Function(_ProductResponseApiDto) _then;

/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? results = null,}) {
  return _then(_ProductResponseApiDto(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ProductApiDto>,
  ));
}


}

// dart format on
