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
mixin _$SpecificationApiDto {

 String get name;
/// Create a copy of SpecificationApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecificationApiDtoCopyWith<SpecificationApiDto> get copyWith => _$SpecificationApiDtoCopyWithImpl<SpecificationApiDto>(this as SpecificationApiDto, _$identity);

  /// Serializes this SpecificationApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecificationApiDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'SpecificationApiDto(name: $name)';
}


}

/// @nodoc
abstract mixin class $SpecificationApiDtoCopyWith<$Res>  {
  factory $SpecificationApiDtoCopyWith(SpecificationApiDto value, $Res Function(SpecificationApiDto) _then) = _$SpecificationApiDtoCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$SpecificationApiDtoCopyWithImpl<$Res>
    implements $SpecificationApiDtoCopyWith<$Res> {
  _$SpecificationApiDtoCopyWithImpl(this._self, this._then);

  final SpecificationApiDto _self;
  final $Res Function(SpecificationApiDto) _then;

/// Create a copy of SpecificationApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecificationApiDto].
extension SpecificationApiDtoPatterns on SpecificationApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecificationApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecificationApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecificationApiDto value)  $default,){
final _that = this;
switch (_that) {
case _SpecificationApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecificationApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _SpecificationApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecificationApiDto() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _SpecificationApiDto():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _SpecificationApiDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecificationApiDto implements SpecificationApiDto {
  const _SpecificationApiDto({required this.name});
  factory _SpecificationApiDto.fromJson(Map<String, dynamic> json) => _$SpecificationApiDtoFromJson(json);

@override final  String name;

/// Create a copy of SpecificationApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecificationApiDtoCopyWith<_SpecificationApiDto> get copyWith => __$SpecificationApiDtoCopyWithImpl<_SpecificationApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecificationApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecificationApiDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'SpecificationApiDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$SpecificationApiDtoCopyWith<$Res> implements $SpecificationApiDtoCopyWith<$Res> {
  factory _$SpecificationApiDtoCopyWith(_SpecificationApiDto value, $Res Function(_SpecificationApiDto) _then) = __$SpecificationApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$SpecificationApiDtoCopyWithImpl<$Res>
    implements _$SpecificationApiDtoCopyWith<$Res> {
  __$SpecificationApiDtoCopyWithImpl(this._self, this._then);

  final _SpecificationApiDto _self;
  final $Res Function(_SpecificationApiDto) _then;

/// Create a copy of SpecificationApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_SpecificationApiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpecificationDataApiDto {

 SpecificationApiDto get attribute; String get value;
/// Create a copy of SpecificationDataApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecificationDataApiDtoCopyWith<SpecificationDataApiDto> get copyWith => _$SpecificationDataApiDtoCopyWithImpl<SpecificationDataApiDto>(this as SpecificationDataApiDto, _$identity);

  /// Serializes this SpecificationDataApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecificationDataApiDto&&(identical(other.attribute, attribute) || other.attribute == attribute)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attribute,value);

@override
String toString() {
  return 'SpecificationDataApiDto(attribute: $attribute, value: $value)';
}


}

/// @nodoc
abstract mixin class $SpecificationDataApiDtoCopyWith<$Res>  {
  factory $SpecificationDataApiDtoCopyWith(SpecificationDataApiDto value, $Res Function(SpecificationDataApiDto) _then) = _$SpecificationDataApiDtoCopyWithImpl;
@useResult
$Res call({
 SpecificationApiDto attribute, String value
});


$SpecificationApiDtoCopyWith<$Res> get attribute;

}
/// @nodoc
class _$SpecificationDataApiDtoCopyWithImpl<$Res>
    implements $SpecificationDataApiDtoCopyWith<$Res> {
  _$SpecificationDataApiDtoCopyWithImpl(this._self, this._then);

  final SpecificationDataApiDto _self;
  final $Res Function(SpecificationDataApiDto) _then;

/// Create a copy of SpecificationDataApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attribute = null,Object? value = null,}) {
  return _then(_self.copyWith(
attribute: null == attribute ? _self.attribute : attribute // ignore: cast_nullable_to_non_nullable
as SpecificationApiDto,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SpecificationDataApiDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpecificationApiDtoCopyWith<$Res> get attribute {
  
  return $SpecificationApiDtoCopyWith<$Res>(_self.attribute, (value) {
    return _then(_self.copyWith(attribute: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpecificationDataApiDto].
extension SpecificationDataApiDtoPatterns on SpecificationDataApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecificationDataApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecificationDataApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecificationDataApiDto value)  $default,){
final _that = this;
switch (_that) {
case _SpecificationDataApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecificationDataApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _SpecificationDataApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SpecificationApiDto attribute,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecificationDataApiDto() when $default != null:
return $default(_that.attribute,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SpecificationApiDto attribute,  String value)  $default,) {final _that = this;
switch (_that) {
case _SpecificationDataApiDto():
return $default(_that.attribute,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SpecificationApiDto attribute,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SpecificationDataApiDto() when $default != null:
return $default(_that.attribute,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecificationDataApiDto implements SpecificationDataApiDto {
  const _SpecificationDataApiDto({required this.attribute, required this.value});
  factory _SpecificationDataApiDto.fromJson(Map<String, dynamic> json) => _$SpecificationDataApiDtoFromJson(json);

@override final  SpecificationApiDto attribute;
@override final  String value;

/// Create a copy of SpecificationDataApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecificationDataApiDtoCopyWith<_SpecificationDataApiDto> get copyWith => __$SpecificationDataApiDtoCopyWithImpl<_SpecificationDataApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecificationDataApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecificationDataApiDto&&(identical(other.attribute, attribute) || other.attribute == attribute)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attribute,value);

@override
String toString() {
  return 'SpecificationDataApiDto(attribute: $attribute, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SpecificationDataApiDtoCopyWith<$Res> implements $SpecificationDataApiDtoCopyWith<$Res> {
  factory _$SpecificationDataApiDtoCopyWith(_SpecificationDataApiDto value, $Res Function(_SpecificationDataApiDto) _then) = __$SpecificationDataApiDtoCopyWithImpl;
@override @useResult
$Res call({
 SpecificationApiDto attribute, String value
});


@override $SpecificationApiDtoCopyWith<$Res> get attribute;

}
/// @nodoc
class __$SpecificationDataApiDtoCopyWithImpl<$Res>
    implements _$SpecificationDataApiDtoCopyWith<$Res> {
  __$SpecificationDataApiDtoCopyWithImpl(this._self, this._then);

  final _SpecificationDataApiDto _self;
  final $Res Function(_SpecificationDataApiDto) _then;

/// Create a copy of SpecificationDataApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attribute = null,Object? value = null,}) {
  return _then(_SpecificationDataApiDto(
attribute: null == attribute ? _self.attribute : attribute // ignore: cast_nullable_to_non_nullable
as SpecificationApiDto,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SpecificationDataApiDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpecificationApiDtoCopyWith<$Res> get attribute {
  
  return $SpecificationApiDtoCopyWith<$Res>(_self.attribute, (value) {
    return _then(_self.copyWith(attribute: value));
  });
}
}

// dart format on
