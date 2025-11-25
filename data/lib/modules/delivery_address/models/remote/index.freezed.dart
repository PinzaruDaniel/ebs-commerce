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
mixin _$StatesApiDto {

 int get id; String get name;@JsonKey(name: 'iso2') String? get code;
/// Create a copy of StatesApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesApiDtoCopyWith<StatesApiDto> get copyWith => _$StatesApiDtoCopyWithImpl<StatesApiDto>(this as StatesApiDto, _$identity);

  /// Serializes this StatesApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code);

@override
String toString() {
  return 'StatesApiDto(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $StatesApiDtoCopyWith<$Res>  {
  factory $StatesApiDtoCopyWith(StatesApiDto value, $Res Function(StatesApiDto) _then) = _$StatesApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'iso2') String? code
});




}
/// @nodoc
class _$StatesApiDtoCopyWithImpl<$Res>
    implements $StatesApiDtoCopyWith<$Res> {
  _$StatesApiDtoCopyWithImpl(this._self, this._then);

  final StatesApiDto _self;
  final $Res Function(StatesApiDto) _then;

/// Create a copy of StatesApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatesApiDto].
extension StatesApiDtoPatterns on StatesApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatesApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatesApiDto value)  $default,){
final _that = this;
switch (_that) {
case _StatesApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatesApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'iso2')  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'iso2')  String? code)  $default,) {final _that = this;
switch (_that) {
case _StatesApiDto():
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'iso2')  String? code)?  $default,) {final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatesApiDto implements StatesApiDto {
  const _StatesApiDto({required this.id, required this.name, @JsonKey(name: 'iso2') this.code});
  factory _StatesApiDto.fromJson(Map<String, dynamic> json) => _$StatesApiDtoFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'iso2') final  String? code;

/// Create a copy of StatesApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatesApiDtoCopyWith<_StatesApiDto> get copyWith => __$StatesApiDtoCopyWithImpl<_StatesApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatesApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code);

@override
String toString() {
  return 'StatesApiDto(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$StatesApiDtoCopyWith<$Res> implements $StatesApiDtoCopyWith<$Res> {
  factory _$StatesApiDtoCopyWith(_StatesApiDto value, $Res Function(_StatesApiDto) _then) = __$StatesApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'iso2') String? code
});




}
/// @nodoc
class __$StatesApiDtoCopyWithImpl<$Res>
    implements _$StatesApiDtoCopyWith<$Res> {
  __$StatesApiDtoCopyWithImpl(this._self, this._then);

  final _StatesApiDto _self;
  final $Res Function(_StatesApiDto) _then;

/// Create a copy of StatesApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(_StatesApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CitiesResponseApiDto {

 int get id; String get name;
/// Create a copy of CitiesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitiesResponseApiDtoCopyWith<CitiesResponseApiDto> get copyWith => _$CitiesResponseApiDtoCopyWithImpl<CitiesResponseApiDto>(this as CitiesResponseApiDto, _$identity);

  /// Serializes this CitiesResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitiesResponseApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CitiesResponseApiDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $CitiesResponseApiDtoCopyWith<$Res>  {
  factory $CitiesResponseApiDtoCopyWith(CitiesResponseApiDto value, $Res Function(CitiesResponseApiDto) _then) = _$CitiesResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$CitiesResponseApiDtoCopyWithImpl<$Res>
    implements $CitiesResponseApiDtoCopyWith<$Res> {
  _$CitiesResponseApiDtoCopyWithImpl(this._self, this._then);

  final CitiesResponseApiDto _self;
  final $Res Function(CitiesResponseApiDto) _then;

/// Create a copy of CitiesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CitiesResponseApiDto].
extension CitiesResponseApiDtoPatterns on CitiesResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CitiesResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CitiesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CitiesResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _CitiesResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CitiesResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _CitiesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CitiesResponseApiDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _CitiesResponseApiDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CitiesResponseApiDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CitiesResponseApiDto implements CitiesResponseApiDto {
  const _CitiesResponseApiDto({required this.id, required this.name});
  factory _CitiesResponseApiDto.fromJson(Map<String, dynamic> json) => _$CitiesResponseApiDtoFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of CitiesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CitiesResponseApiDtoCopyWith<_CitiesResponseApiDto> get copyWith => __$CitiesResponseApiDtoCopyWithImpl<_CitiesResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CitiesResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CitiesResponseApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CitiesResponseApiDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CitiesResponseApiDtoCopyWith<$Res> implements $CitiesResponseApiDtoCopyWith<$Res> {
  factory _$CitiesResponseApiDtoCopyWith(_CitiesResponseApiDto value, $Res Function(_CitiesResponseApiDto) _then) = __$CitiesResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$CitiesResponseApiDtoCopyWithImpl<$Res>
    implements _$CitiesResponseApiDtoCopyWith<$Res> {
  __$CitiesResponseApiDtoCopyWithImpl(this._self, this._then);

  final _CitiesResponseApiDto _self;
  final $Res Function(_CitiesResponseApiDto) _then;

/// Create a copy of CitiesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_CitiesResponseApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CountriesApiDto {

 int get id; String get name; String get iso2;@JsonKey(name: 'phonecode') String get dialCode;
/// Create a copy of CountriesApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountriesApiDtoCopyWith<CountriesApiDto> get copyWith => _$CountriesApiDtoCopyWithImpl<CountriesApiDto>(this as CountriesApiDto, _$identity);

  /// Serializes this CountriesApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountriesApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iso2,dialCode);

@override
String toString() {
  return 'CountriesApiDto(id: $id, name: $name, iso2: $iso2, dialCode: $dialCode)';
}


}

/// @nodoc
abstract mixin class $CountriesApiDtoCopyWith<$Res>  {
  factory $CountriesApiDtoCopyWith(CountriesApiDto value, $Res Function(CountriesApiDto) _then) = _$CountriesApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String iso2,@JsonKey(name: 'phonecode') String dialCode
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iso2 = null,Object? dialCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String iso2, @JsonKey(name: 'phonecode')  String dialCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
return $default(_that.id,_that.name,_that.iso2,_that.dialCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String iso2, @JsonKey(name: 'phonecode')  String dialCode)  $default,) {final _that = this;
switch (_that) {
case _CountriesApiDto():
return $default(_that.id,_that.name,_that.iso2,_that.dialCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String iso2, @JsonKey(name: 'phonecode')  String dialCode)?  $default,) {final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
return $default(_that.id,_that.name,_that.iso2,_that.dialCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountriesApiDto implements CountriesApiDto {
  const _CountriesApiDto({required this.id, required this.name, required this.iso2, @JsonKey(name: 'phonecode') required this.dialCode});
  factory _CountriesApiDto.fromJson(Map<String, dynamic> json) => _$CountriesApiDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String iso2;
@override@JsonKey(name: 'phonecode') final  String dialCode;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountriesApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iso2,dialCode);

@override
String toString() {
  return 'CountriesApiDto(id: $id, name: $name, iso2: $iso2, dialCode: $dialCode)';
}


}

/// @nodoc
abstract mixin class _$CountriesApiDtoCopyWith<$Res> implements $CountriesApiDtoCopyWith<$Res> {
  factory _$CountriesApiDtoCopyWith(_CountriesApiDto value, $Res Function(_CountriesApiDto) _then) = __$CountriesApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String iso2,@JsonKey(name: 'phonecode') String dialCode
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iso2 = null,Object? dialCode = null,}) {
  return _then(_CountriesApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DialCodesDto {

 String get name; String get code;@JsonKey(name: "dial_code") String get dialCode;
/// Create a copy of DialCodesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DialCodesDtoCopyWith<DialCodesDto> get copyWith => _$DialCodesDtoCopyWithImpl<DialCodesDto>(this as DialCodesDto, _$identity);

  /// Serializes this DialCodesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialCodesDto&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,dialCode);

@override
String toString() {
  return 'DialCodesDto(name: $name, code: $code, dialCode: $dialCode)';
}


}

/// @nodoc
abstract mixin class $DialCodesDtoCopyWith<$Res>  {
  factory $DialCodesDtoCopyWith(DialCodesDto value, $Res Function(DialCodesDto) _then) = _$DialCodesDtoCopyWithImpl;
@useResult
$Res call({
 String name, String code,@JsonKey(name: "dial_code") String dialCode
});




}
/// @nodoc
class _$DialCodesDtoCopyWithImpl<$Res>
    implements $DialCodesDtoCopyWith<$Res> {
  _$DialCodesDtoCopyWithImpl(this._self, this._then);

  final DialCodesDto _self;
  final $Res Function(DialCodesDto) _then;

/// Create a copy of DialCodesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? dialCode = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DialCodesDto].
extension DialCodesDtoPatterns on DialCodesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DialCodesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DialCodesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DialCodesDto value)  $default,){
final _that = this;
switch (_that) {
case _DialCodesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DialCodesDto value)?  $default,){
final _that = this;
switch (_that) {
case _DialCodesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code, @JsonKey(name: "dial_code")  String dialCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DialCodesDto() when $default != null:
return $default(_that.name,_that.code,_that.dialCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code, @JsonKey(name: "dial_code")  String dialCode)  $default,) {final _that = this;
switch (_that) {
case _DialCodesDto():
return $default(_that.name,_that.code,_that.dialCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code, @JsonKey(name: "dial_code")  String dialCode)?  $default,) {final _that = this;
switch (_that) {
case _DialCodesDto() when $default != null:
return $default(_that.name,_that.code,_that.dialCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DialCodesDto implements DialCodesDto {
  const _DialCodesDto({required this.name, required this.code, @JsonKey(name: "dial_code") required this.dialCode});
  factory _DialCodesDto.fromJson(Map<String, dynamic> json) => _$DialCodesDtoFromJson(json);

@override final  String name;
@override final  String code;
@override@JsonKey(name: "dial_code") final  String dialCode;

/// Create a copy of DialCodesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DialCodesDtoCopyWith<_DialCodesDto> get copyWith => __$DialCodesDtoCopyWithImpl<_DialCodesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DialCodesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DialCodesDto&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,dialCode);

@override
String toString() {
  return 'DialCodesDto(name: $name, code: $code, dialCode: $dialCode)';
}


}

/// @nodoc
abstract mixin class _$DialCodesDtoCopyWith<$Res> implements $DialCodesDtoCopyWith<$Res> {
  factory _$DialCodesDtoCopyWith(_DialCodesDto value, $Res Function(_DialCodesDto) _then) = __$DialCodesDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String code,@JsonKey(name: "dial_code") String dialCode
});




}
/// @nodoc
class __$DialCodesDtoCopyWithImpl<$Res>
    implements _$DialCodesDtoCopyWith<$Res> {
  __$DialCodesDtoCopyWithImpl(this._self, this._then);

  final _DialCodesDto _self;
  final $Res Function(_DialCodesDto) _then;

/// Create a copy of DialCodesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? dialCode = null,}) {
  return _then(_DialCodesDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DialCodesResponseApiDto {

 List<DialCodesDto> get data;
/// Create a copy of DialCodesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DialCodesResponseApiDtoCopyWith<DialCodesResponseApiDto> get copyWith => _$DialCodesResponseApiDtoCopyWithImpl<DialCodesResponseApiDto>(this as DialCodesResponseApiDto, _$identity);

  /// Serializes this DialCodesResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialCodesResponseApiDto&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DialCodesResponseApiDto(data: $data)';
}


}

/// @nodoc
abstract mixin class $DialCodesResponseApiDtoCopyWith<$Res>  {
  factory $DialCodesResponseApiDtoCopyWith(DialCodesResponseApiDto value, $Res Function(DialCodesResponseApiDto) _then) = _$DialCodesResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 List<DialCodesDto> data
});




}
/// @nodoc
class _$DialCodesResponseApiDtoCopyWithImpl<$Res>
    implements $DialCodesResponseApiDtoCopyWith<$Res> {
  _$DialCodesResponseApiDtoCopyWithImpl(this._self, this._then);

  final DialCodesResponseApiDto _self;
  final $Res Function(DialCodesResponseApiDto) _then;

/// Create a copy of DialCodesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DialCodesDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [DialCodesResponseApiDto].
extension DialCodesResponseApiDtoPatterns on DialCodesResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DialCodesResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DialCodesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DialCodesResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _DialCodesResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DialCodesResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _DialCodesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DialCodesDto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DialCodesResponseApiDto() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DialCodesDto> data)  $default,) {final _that = this;
switch (_that) {
case _DialCodesResponseApiDto():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DialCodesDto> data)?  $default,) {final _that = this;
switch (_that) {
case _DialCodesResponseApiDto() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DialCodesResponseApiDto implements DialCodesResponseApiDto {
  const _DialCodesResponseApiDto({required final  List<DialCodesDto> data}): _data = data;
  factory _DialCodesResponseApiDto.fromJson(Map<String, dynamic> json) => _$DialCodesResponseApiDtoFromJson(json);

 final  List<DialCodesDto> _data;
@override List<DialCodesDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of DialCodesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DialCodesResponseApiDtoCopyWith<_DialCodesResponseApiDto> get copyWith => __$DialCodesResponseApiDtoCopyWithImpl<_DialCodesResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DialCodesResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DialCodesResponseApiDto&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DialCodesResponseApiDto(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DialCodesResponseApiDtoCopyWith<$Res> implements $DialCodesResponseApiDtoCopyWith<$Res> {
  factory _$DialCodesResponseApiDtoCopyWith(_DialCodesResponseApiDto value, $Res Function(_DialCodesResponseApiDto) _then) = __$DialCodesResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 List<DialCodesDto> data
});




}
/// @nodoc
class __$DialCodesResponseApiDtoCopyWithImpl<$Res>
    implements _$DialCodesResponseApiDtoCopyWith<$Res> {
  __$DialCodesResponseApiDtoCopyWithImpl(this._self, this._then);

  final _DialCodesResponseApiDto _self;
  final $Res Function(_DialCodesResponseApiDto) _then;

/// Create a copy of DialCodesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_DialCodesResponseApiDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DialCodesDto>,
  ));
}


}


/// @nodoc
mixin _$DeliveryAddressUserApiDto {

 String get street; String get city; String get state; String get zip; String get country;
/// Create a copy of DeliveryAddressUserApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAddressUserApiDtoCopyWith<DeliveryAddressUserApiDto> get copyWith => _$DeliveryAddressUserApiDtoCopyWithImpl<DeliveryAddressUserApiDto>(this as DeliveryAddressUserApiDto, _$identity);

  /// Serializes this DeliveryAddressUserApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAddressUserApiDto&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,city,state,zip,country);

@override
String toString() {
  return 'DeliveryAddressUserApiDto(street: $street, city: $city, state: $state, zip: $zip, country: $country)';
}


}

/// @nodoc
abstract mixin class $DeliveryAddressUserApiDtoCopyWith<$Res>  {
  factory $DeliveryAddressUserApiDtoCopyWith(DeliveryAddressUserApiDto value, $Res Function(DeliveryAddressUserApiDto) _then) = _$DeliveryAddressUserApiDtoCopyWithImpl;
@useResult
$Res call({
 String street, String city, String state, String zip, String country
});




}
/// @nodoc
class _$DeliveryAddressUserApiDtoCopyWithImpl<$Res>
    implements $DeliveryAddressUserApiDtoCopyWith<$Res> {
  _$DeliveryAddressUserApiDtoCopyWithImpl(this._self, this._then);

  final DeliveryAddressUserApiDto _self;
  final $Res Function(DeliveryAddressUserApiDto) _then;

/// Create a copy of DeliveryAddressUserApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? street = null,Object? city = null,Object? state = null,Object? zip = null,Object? country = null,}) {
  return _then(_self.copyWith(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zip: null == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryAddressUserApiDto].
extension DeliveryAddressUserApiDtoPatterns on DeliveryAddressUserApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryAddressUserApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryAddressUserApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryAddressUserApiDto value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddressUserApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryAddressUserApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddressUserApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String street,  String city,  String state,  String zip,  String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryAddressUserApiDto() when $default != null:
return $default(_that.street,_that.city,_that.state,_that.zip,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String street,  String city,  String state,  String zip,  String country)  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddressUserApiDto():
return $default(_that.street,_that.city,_that.state,_that.zip,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String street,  String city,  String state,  String zip,  String country)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddressUserApiDto() when $default != null:
return $default(_that.street,_that.city,_that.state,_that.zip,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryAddressUserApiDto implements DeliveryAddressUserApiDto {
  const _DeliveryAddressUserApiDto({required this.street, required this.city, required this.state, required this.zip, required this.country});
  factory _DeliveryAddressUserApiDto.fromJson(Map<String, dynamic> json) => _$DeliveryAddressUserApiDtoFromJson(json);

@override final  String street;
@override final  String city;
@override final  String state;
@override final  String zip;
@override final  String country;

/// Create a copy of DeliveryAddressUserApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAddressUserApiDtoCopyWith<_DeliveryAddressUserApiDto> get copyWith => __$DeliveryAddressUserApiDtoCopyWithImpl<_DeliveryAddressUserApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryAddressUserApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAddressUserApiDto&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,city,state,zip,country);

@override
String toString() {
  return 'DeliveryAddressUserApiDto(street: $street, city: $city, state: $state, zip: $zip, country: $country)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAddressUserApiDtoCopyWith<$Res> implements $DeliveryAddressUserApiDtoCopyWith<$Res> {
  factory _$DeliveryAddressUserApiDtoCopyWith(_DeliveryAddressUserApiDto value, $Res Function(_DeliveryAddressUserApiDto) _then) = __$DeliveryAddressUserApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String street, String city, String state, String zip, String country
});




}
/// @nodoc
class __$DeliveryAddressUserApiDtoCopyWithImpl<$Res>
    implements _$DeliveryAddressUserApiDtoCopyWith<$Res> {
  __$DeliveryAddressUserApiDtoCopyWithImpl(this._self, this._then);

  final _DeliveryAddressUserApiDto _self;
  final $Res Function(_DeliveryAddressUserApiDto) _then;

/// Create a copy of DeliveryAddressUserApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? street = null,Object? city = null,Object? state = null,Object? zip = null,Object? country = null,}) {
  return _then(_DeliveryAddressUserApiDto(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zip: null == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
