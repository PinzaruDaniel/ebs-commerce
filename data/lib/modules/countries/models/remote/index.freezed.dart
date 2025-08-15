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
mixin _$CountriesApiDto {

 String get name; String? get iso2;
/// Create a copy of CountriesApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountriesApiDtoCopyWith<CountriesApiDto> get copyWith => _$CountriesApiDtoCopyWithImpl<CountriesApiDto>(this as CountriesApiDto, _$identity);

  /// Serializes this CountriesApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountriesApiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,iso2);

@override
String toString() {
  return 'CountriesApiDto(name: $name, iso2: $iso2)';
}


}

/// @nodoc
abstract mixin class $CountriesApiDtoCopyWith<$Res>  {
  factory $CountriesApiDtoCopyWith(CountriesApiDto value, $Res Function(CountriesApiDto) _then) = _$CountriesApiDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? iso2
});




}
/// @nodoc
class _$CountriesApiDtoCopyWithImpl<$Res>
    implements $CountriesApiDtoCopyWith<$Res> {
  _$CountriesApiDtoCopyWithImpl(this._self, this._then);

  final CountriesApiDto _self;
  final $Res Function(CountriesApiDto) _then;

/// Create a copy of CountriesApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? iso2 = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CountriesApiDto].
extension CountriesApiDtoPatterns on CountriesApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountriesApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountriesApiDto value)  $default,){
final _that = this;
switch (_that) {
case _CountriesApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountriesApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? iso2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
return $default(_that.name,_that.iso2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? iso2)  $default,) {final _that = this;
switch (_that) {
case _CountriesApiDto():
return $default(_that.name,_that.iso2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? iso2)?  $default,) {final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
return $default(_that.name,_that.iso2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountriesApiDto implements CountriesApiDto {
  const _CountriesApiDto({required this.name, this.iso2});
  factory _CountriesApiDto.fromJson(Map<String, dynamic> json) => _$CountriesApiDtoFromJson(json);

@override final  String name;
@override final  String? iso2;

/// Create a copy of CountriesApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountriesApiDtoCopyWith<_CountriesApiDto> get copyWith => __$CountriesApiDtoCopyWithImpl<_CountriesApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountriesApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountriesApiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,iso2);

@override
String toString() {
  return 'CountriesApiDto(name: $name, iso2: $iso2)';
}


}

/// @nodoc
abstract mixin class _$CountriesApiDtoCopyWith<$Res> implements $CountriesApiDtoCopyWith<$Res> {
  factory _$CountriesApiDtoCopyWith(_CountriesApiDto value, $Res Function(_CountriesApiDto) _then) = __$CountriesApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? iso2
});




}
/// @nodoc
class __$CountriesApiDtoCopyWithImpl<$Res>
    implements _$CountriesApiDtoCopyWith<$Res> {
  __$CountriesApiDtoCopyWithImpl(this._self, this._then);

  final _CountriesApiDto _self;
  final $Res Function(_CountriesApiDto) _then;

/// Create a copy of CountriesApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? iso2 = freezed,}) {
  return _then(_CountriesApiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CountriesResponseApiDto {

 bool get error; String get msg; List<CountriesApiDto> get data;
/// Create a copy of CountriesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountriesResponseApiDtoCopyWith<CountriesResponseApiDto> get copyWith => _$CountriesResponseApiDtoCopyWithImpl<CountriesResponseApiDto>(this as CountriesResponseApiDto, _$identity);

  /// Serializes this CountriesResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountriesResponseApiDto&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,msg,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CountriesResponseApiDto(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class $CountriesResponseApiDtoCopyWith<$Res>  {
  factory $CountriesResponseApiDtoCopyWith(CountriesResponseApiDto value, $Res Function(CountriesResponseApiDto) _then) = _$CountriesResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 bool error, String msg, List<CountriesApiDto> data
});




}
/// @nodoc
class _$CountriesResponseApiDtoCopyWithImpl<$Res>
    implements $CountriesResponseApiDtoCopyWith<$Res> {
  _$CountriesResponseApiDtoCopyWithImpl(this._self, this._then);

  final CountriesResponseApiDto _self;
  final $Res Function(CountriesResponseApiDto) _then;

/// Create a copy of CountriesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CountriesApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CountriesResponseApiDto].
extension CountriesResponseApiDtoPatterns on CountriesResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountriesResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountriesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountriesResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _CountriesResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountriesResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _CountriesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String msg,  List<CountriesApiDto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountriesResponseApiDto() when $default != null:
return $default(_that.error,_that.msg,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String msg,  List<CountriesApiDto> data)  $default,) {final _that = this;
switch (_that) {
case _CountriesResponseApiDto():
return $default(_that.error,_that.msg,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String msg,  List<CountriesApiDto> data)?  $default,) {final _that = this;
switch (_that) {
case _CountriesResponseApiDto() when $default != null:
return $default(_that.error,_that.msg,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountriesResponseApiDto implements CountriesResponseApiDto {
  const _CountriesResponseApiDto({required this.error, required this.msg, required final  List<CountriesApiDto> data}): _data = data;
  factory _CountriesResponseApiDto.fromJson(Map<String, dynamic> json) => _$CountriesResponseApiDtoFromJson(json);

@override final  bool error;
@override final  String msg;
 final  List<CountriesApiDto> _data;
@override List<CountriesApiDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CountriesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountriesResponseApiDtoCopyWith<_CountriesResponseApiDto> get copyWith => __$CountriesResponseApiDtoCopyWithImpl<_CountriesResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountriesResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountriesResponseApiDto&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,msg,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CountriesResponseApiDto(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CountriesResponseApiDtoCopyWith<$Res> implements $CountriesResponseApiDtoCopyWith<$Res> {
  factory _$CountriesResponseApiDtoCopyWith(_CountriesResponseApiDto value, $Res Function(_CountriesResponseApiDto) _then) = __$CountriesResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 bool error, String msg, List<CountriesApiDto> data
});




}
/// @nodoc
class __$CountriesResponseApiDtoCopyWithImpl<$Res>
    implements _$CountriesResponseApiDtoCopyWith<$Res> {
  __$CountriesResponseApiDtoCopyWithImpl(this._self, this._then);

  final _CountriesResponseApiDto _self;
  final $Res Function(_CountriesResponseApiDto) _then;

/// Create a copy of CountriesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_CountriesResponseApiDto(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CountriesApiDto>,
  ));
}


}

// dart format on
