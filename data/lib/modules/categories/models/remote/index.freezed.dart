// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryApiDto {

 int get id; String get name; int get level; int? get parent;
/// Create a copy of CategoryApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryApiDtoCopyWith<CategoryApiDto> get copyWith => _$CategoryApiDtoCopyWithImpl<CategoryApiDto>(this as CategoryApiDto, _$identity);

  /// Serializes this CategoryApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.parent, parent) || other.parent == parent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,parent);

@override
String toString() {
  return 'CategoryApiDto(id: $id, name: $name, level: $level, parent: $parent)';
}


}

/// @nodoc
abstract mixin class $CategoryApiDtoCopyWith<$Res>  {
  factory $CategoryApiDtoCopyWith(CategoryApiDto value, $Res Function(CategoryApiDto) _then) = _$CategoryApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, int level, int? parent
});




}
/// @nodoc
class _$CategoryApiDtoCopyWithImpl<$Res>
    implements $CategoryApiDtoCopyWith<$Res> {
  _$CategoryApiDtoCopyWithImpl(this._self, this._then);

  final CategoryApiDto _self;
  final $Res Function(CategoryApiDto) _then;

/// Create a copy of CategoryApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? level = null,Object? parent = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryApiDto].
extension CategoryApiDtoPatterns on CategoryApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryApiDto value)  $default,){
final _that = this;
switch (_that) {
case _CategoryApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int level,  int? parent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryApiDto() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.parent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int level,  int? parent)  $default,) {final _that = this;
switch (_that) {
case _CategoryApiDto():
return $default(_that.id,_that.name,_that.level,_that.parent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int level,  int? parent)?  $default,) {final _that = this;
switch (_that) {
case _CategoryApiDto() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.parent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryApiDto implements CategoryApiDto {
  const _CategoryApiDto({required this.id, required this.name, required this.level, required this.parent});
  factory _CategoryApiDto.fromJson(Map<String, dynamic> json) => _$CategoryApiDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  int level;
@override final  int? parent;

/// Create a copy of CategoryApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryApiDtoCopyWith<_CategoryApiDto> get copyWith => __$CategoryApiDtoCopyWithImpl<_CategoryApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.parent, parent) || other.parent == parent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,parent);

@override
String toString() {
  return 'CategoryApiDto(id: $id, name: $name, level: $level, parent: $parent)';
}


}

/// @nodoc
abstract mixin class _$CategoryApiDtoCopyWith<$Res> implements $CategoryApiDtoCopyWith<$Res> {
  factory _$CategoryApiDtoCopyWith(_CategoryApiDto value, $Res Function(_CategoryApiDto) _then) = __$CategoryApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int level, int? parent
});




}
/// @nodoc
class __$CategoryApiDtoCopyWithImpl<$Res>
    implements _$CategoryApiDtoCopyWith<$Res> {
  __$CategoryApiDtoCopyWithImpl(this._self, this._then);

  final _CategoryApiDto _self;
  final $Res Function(_CategoryApiDto) _then;

/// Create a copy of CategoryApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,Object? parent = freezed,}) {
  return _then(_CategoryApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CategoryResponseApiDto {

@JsonKey(name: 'total_pages') int? get totalPages;@JsonKey(name: 'per_page') int? get perPage;@JsonKey(name: 'current_page') int? get currentPage; List<CategoryApiDto> get results;
/// Create a copy of CategoryResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryResponseApiDtoCopyWith<CategoryResponseApiDto> get copyWith => _$CategoryResponseApiDtoCopyWithImpl<CategoryResponseApiDto>(this as CategoryResponseApiDto, _$identity);

  /// Serializes this CategoryResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryResponseApiDto&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CategoryResponseApiDto(totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, results: $results)';
}


}

/// @nodoc
abstract mixin class $CategoryResponseApiDtoCopyWith<$Res>  {
  factory $CategoryResponseApiDtoCopyWith(CategoryResponseApiDto value, $Res Function(CategoryResponseApiDto) _then) = _$CategoryResponseApiDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_pages') int? totalPages,@JsonKey(name: 'per_page') int? perPage,@JsonKey(name: 'current_page') int? currentPage, List<CategoryApiDto> results
});




}
/// @nodoc
class _$CategoryResponseApiDtoCopyWithImpl<$Res>
    implements $CategoryResponseApiDtoCopyWith<$Res> {
  _$CategoryResponseApiDtoCopyWithImpl(this._self, this._then);

  final CategoryResponseApiDto _self;
  final $Res Function(CategoryResponseApiDto) _then;

/// Create a copy of CategoryResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<CategoryApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryResponseApiDto].
extension CategoryResponseApiDtoPatterns on CategoryResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _CategoryResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'current_page')  int? currentPage,  List<CategoryApiDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryResponseApiDto() when $default != null:
return $default(_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'current_page')  int? currentPage,  List<CategoryApiDto> results)  $default,) {final _that = this;
switch (_that) {
case _CategoryResponseApiDto():
return $default(_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'current_page')  int? currentPage,  List<CategoryApiDto> results)?  $default,) {final _that = this;
switch (_that) {
case _CategoryResponseApiDto() when $default != null:
return $default(_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryResponseApiDto implements CategoryResponseApiDto {
  const _CategoryResponseApiDto({@JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'per_page') required this.perPage, @JsonKey(name: 'current_page') required this.currentPage, required final  List<CategoryApiDto> results}): _results = results;
  factory _CategoryResponseApiDto.fromJson(Map<String, dynamic> json) => _$CategoryResponseApiDtoFromJson(json);

@override@JsonKey(name: 'total_pages') final  int? totalPages;
@override@JsonKey(name: 'per_page') final  int? perPage;
@override@JsonKey(name: 'current_page') final  int? currentPage;
 final  List<CategoryApiDto> _results;
@override List<CategoryApiDto> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of CategoryResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryResponseApiDtoCopyWith<_CategoryResponseApiDto> get copyWith => __$CategoryResponseApiDtoCopyWithImpl<_CategoryResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryResponseApiDto&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'CategoryResponseApiDto(totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CategoryResponseApiDtoCopyWith<$Res> implements $CategoryResponseApiDtoCopyWith<$Res> {
  factory _$CategoryResponseApiDtoCopyWith(_CategoryResponseApiDto value, $Res Function(_CategoryResponseApiDto) _then) = __$CategoryResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_pages') int? totalPages,@JsonKey(name: 'per_page') int? perPage,@JsonKey(name: 'current_page') int? currentPage, List<CategoryApiDto> results
});




}
/// @nodoc
class __$CategoryResponseApiDtoCopyWithImpl<$Res>
    implements _$CategoryResponseApiDtoCopyWith<$Res> {
  __$CategoryResponseApiDtoCopyWithImpl(this._self, this._then);

  final _CategoryResponseApiDto _self;
  final $Res Function(_CategoryResponseApiDto) _then;

/// Create a copy of CategoryResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? results = null,}) {
  return _then(_CategoryResponseApiDto(
totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<CategoryApiDto>,
  ));
}


}

// dart format on
