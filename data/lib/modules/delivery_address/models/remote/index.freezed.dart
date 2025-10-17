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
mixin _$StatesResponseApiDto {

 bool get error; String get msg; StatesDataApiDto get data;
/// Create a copy of StatesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesResponseApiDtoCopyWith<StatesResponseApiDto> get copyWith => _$StatesResponseApiDtoCopyWithImpl<StatesResponseApiDto>(this as StatesResponseApiDto, _$identity);

  /// Serializes this StatesResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesResponseApiDto&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,msg,data);

@override
String toString() {
  return 'StatesResponseApiDto(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class $StatesResponseApiDtoCopyWith<$Res>  {
  factory $StatesResponseApiDtoCopyWith(StatesResponseApiDto value, $Res Function(StatesResponseApiDto) _then) = _$StatesResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 bool error, String msg, StatesDataApiDto data
});


$StatesDataApiDtoCopyWith<$Res> get data;

}
/// @nodoc
class _$StatesResponseApiDtoCopyWithImpl<$Res>
    implements $StatesResponseApiDtoCopyWith<$Res> {
  _$StatesResponseApiDtoCopyWithImpl(this._self, this._then);

  final StatesResponseApiDto _self;
  final $Res Function(StatesResponseApiDto) _then;

/// Create a copy of StatesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StatesDataApiDto,
  ));
}
/// Create a copy of StatesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatesDataApiDtoCopyWith<$Res> get data {
  
  return $StatesDataApiDtoCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [StatesResponseApiDto].
extension StatesResponseApiDtoPatterns on StatesResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatesResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatesResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _StatesResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatesResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _StatesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String msg,  StatesDataApiDto data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String msg,  StatesDataApiDto data)  $default,) {final _that = this;
switch (_that) {
case _StatesResponseApiDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String msg,  StatesDataApiDto data)?  $default,) {final _that = this;
switch (_that) {
case _StatesResponseApiDto() when $default != null:
return $default(_that.error,_that.msg,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatesResponseApiDto implements StatesResponseApiDto {
  const _StatesResponseApiDto({required this.error, required this.msg, required this.data});
  factory _StatesResponseApiDto.fromJson(Map<String, dynamic> json) => _$StatesResponseApiDtoFromJson(json);

@override final  bool error;
@override final  String msg;
@override final  StatesDataApiDto data;

/// Create a copy of StatesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatesResponseApiDtoCopyWith<_StatesResponseApiDto> get copyWith => __$StatesResponseApiDtoCopyWithImpl<_StatesResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatesResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesResponseApiDto&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,msg,data);

@override
String toString() {
  return 'StatesResponseApiDto(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class _$StatesResponseApiDtoCopyWith<$Res> implements $StatesResponseApiDtoCopyWith<$Res> {
  factory _$StatesResponseApiDtoCopyWith(_StatesResponseApiDto value, $Res Function(_StatesResponseApiDto) _then) = __$StatesResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 bool error, String msg, StatesDataApiDto data
});


@override $StatesDataApiDtoCopyWith<$Res> get data;

}
/// @nodoc
class __$StatesResponseApiDtoCopyWithImpl<$Res>
    implements _$StatesResponseApiDtoCopyWith<$Res> {
  __$StatesResponseApiDtoCopyWithImpl(this._self, this._then);

  final _StatesResponseApiDto _self;
  final $Res Function(_StatesResponseApiDto) _then;

/// Create a copy of StatesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_StatesResponseApiDto(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StatesDataApiDto,
  ));
}

/// Create a copy of StatesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatesDataApiDtoCopyWith<$Res> get data {
  
  return $StatesDataApiDtoCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$StatesApiDto {

 String get name;@JsonKey(name: 'state_code') String get code;
/// Create a copy of StatesApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesApiDtoCopyWith<StatesApiDto> get copyWith => _$StatesApiDtoCopyWithImpl<StatesApiDto>(this as StatesApiDto, _$identity);

  /// Serializes this StatesApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesApiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'StatesApiDto(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $StatesApiDtoCopyWith<$Res>  {
  factory $StatesApiDtoCopyWith(StatesApiDto value, $Res Function(StatesApiDto) _then) = _$StatesApiDtoCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'state_code') String code
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'state_code')  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'state_code')  String code)  $default,) {final _that = this;
switch (_that) {
case _StatesApiDto():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'state_code')  String code)?  $default,) {final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatesApiDto implements StatesApiDto {
  const _StatesApiDto({required this.name, @JsonKey(name: 'state_code') required this.code});
  factory _StatesApiDto.fromJson(Map<String, dynamic> json) => _$StatesApiDtoFromJson(json);

@override final  String name;
@override@JsonKey(name: 'state_code') final  String code;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesApiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'StatesApiDto(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$StatesApiDtoCopyWith<$Res> implements $StatesApiDtoCopyWith<$Res> {
  factory _$StatesApiDtoCopyWith(_StatesApiDto value, $Res Function(_StatesApiDto) _then) = __$StatesApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'state_code') String code
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_StatesApiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StatesDataApiDto {

 String get name; List<StatesApiDto> get states;
/// Create a copy of StatesDataApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesDataApiDtoCopyWith<StatesDataApiDto> get copyWith => _$StatesDataApiDtoCopyWithImpl<StatesDataApiDto>(this as StatesDataApiDto, _$identity);

  /// Serializes this StatesDataApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesDataApiDto&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.states, states));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(states));

@override
String toString() {
  return 'StatesDataApiDto(name: $name, states: $states)';
}


}

/// @nodoc
abstract mixin class $StatesDataApiDtoCopyWith<$Res>  {
  factory $StatesDataApiDtoCopyWith(StatesDataApiDto value, $Res Function(StatesDataApiDto) _then) = _$StatesDataApiDtoCopyWithImpl;
@useResult
$Res call({
 String name, List<StatesApiDto> states
});




}
/// @nodoc
class _$StatesDataApiDtoCopyWithImpl<$Res>
    implements $StatesDataApiDtoCopyWith<$Res> {
  _$StatesDataApiDtoCopyWithImpl(this._self, this._then);

  final StatesDataApiDto _self;
  final $Res Function(StatesDataApiDto) _then;

/// Create a copy of StatesDataApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? states = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<StatesApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [StatesDataApiDto].
extension StatesDataApiDtoPatterns on StatesDataApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatesDataApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatesDataApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatesDataApiDto value)  $default,){
final _that = this;
switch (_that) {
case _StatesDataApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatesDataApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _StatesDataApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<StatesApiDto> states)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesDataApiDto() when $default != null:
return $default(_that.name,_that.states);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<StatesApiDto> states)  $default,) {final _that = this;
switch (_that) {
case _StatesDataApiDto():
return $default(_that.name,_that.states);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<StatesApiDto> states)?  $default,) {final _that = this;
switch (_that) {
case _StatesDataApiDto() when $default != null:
return $default(_that.name,_that.states);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatesDataApiDto implements StatesDataApiDto {
  const _StatesDataApiDto({required this.name, required final  List<StatesApiDto> states}): _states = states;
  factory _StatesDataApiDto.fromJson(Map<String, dynamic> json) => _$StatesDataApiDtoFromJson(json);

@override final  String name;
 final  List<StatesApiDto> _states;
@override List<StatesApiDto> get states {
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_states);
}


/// Create a copy of StatesDataApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatesDataApiDtoCopyWith<_StatesDataApiDto> get copyWith => __$StatesDataApiDtoCopyWithImpl<_StatesDataApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatesDataApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesDataApiDto&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._states, _states));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_states));

@override
String toString() {
  return 'StatesDataApiDto(name: $name, states: $states)';
}


}

/// @nodoc
abstract mixin class _$StatesDataApiDtoCopyWith<$Res> implements $StatesDataApiDtoCopyWith<$Res> {
  factory _$StatesDataApiDtoCopyWith(_StatesDataApiDto value, $Res Function(_StatesDataApiDto) _then) = __$StatesDataApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, List<StatesApiDto> states
});




}
/// @nodoc
class __$StatesDataApiDtoCopyWithImpl<$Res>
    implements _$StatesDataApiDtoCopyWith<$Res> {
  __$StatesDataApiDtoCopyWithImpl(this._self, this._then);

  final _StatesDataApiDto _self;
  final $Res Function(_StatesDataApiDto) _then;

/// Create a copy of StatesDataApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? states = null,}) {
  return _then(_StatesDataApiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,states: null == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<StatesApiDto>,
  ));
}


}


/// @nodoc
mixin _$CitiesResponseApiDto {

 bool get error; String get msg; List<String> get data;
/// Create a copy of CitiesResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitiesResponseApiDtoCopyWith<CitiesResponseApiDto> get copyWith => _$CitiesResponseApiDtoCopyWithImpl<CitiesResponseApiDto>(this as CitiesResponseApiDto, _$identity);

  /// Serializes this CitiesResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitiesResponseApiDto&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,msg,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CitiesResponseApiDto(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class $CitiesResponseApiDtoCopyWith<$Res>  {
  factory $CitiesResponseApiDtoCopyWith(CitiesResponseApiDto value, $Res Function(CitiesResponseApiDto) _then) = _$CitiesResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 bool error, String msg, List<String> data
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
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String msg,  List<String> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CitiesResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String msg,  List<String> data)  $default,) {final _that = this;
switch (_that) {
case _CitiesResponseApiDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String msg,  List<String> data)?  $default,) {final _that = this;
switch (_that) {
case _CitiesResponseApiDto() when $default != null:
return $default(_that.error,_that.msg,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CitiesResponseApiDto implements CitiesResponseApiDto {
  const _CitiesResponseApiDto({required this.error, required this.msg, required final  List<String> data}): _data = data;
  factory _CitiesResponseApiDto.fromJson(Map<String, dynamic> json) => _$CitiesResponseApiDtoFromJson(json);

@override final  bool error;
@override final  String msg;
 final  List<String> _data;
@override List<String> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CitiesResponseApiDto&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,msg,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CitiesResponseApiDto(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CitiesResponseApiDtoCopyWith<$Res> implements $CitiesResponseApiDtoCopyWith<$Res> {
  factory _$CitiesResponseApiDtoCopyWith(_CitiesResponseApiDto value, $Res Function(_CitiesResponseApiDto) _then) = __$CitiesResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 bool error, String msg, List<String> data
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
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_CitiesResponseApiDto(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<String>,
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


/// @nodoc
mixin _$CountriesApiDto {

 String get country; String get iso2;
/// Create a copy of CountriesApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountriesApiDtoCopyWith<CountriesApiDto> get copyWith => _$CountriesApiDtoCopyWithImpl<CountriesApiDto>(this as CountriesApiDto, _$identity);

  /// Serializes this CountriesApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountriesApiDto&&(identical(other.country, country) || other.country == country)&&(identical(other.iso2, iso2) || other.iso2 == iso2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,iso2);

@override
String toString() {
  return 'CountriesApiDto(country: $country, iso2: $iso2)';
}


}

/// @nodoc
abstract mixin class $CountriesApiDtoCopyWith<$Res>  {
  factory $CountriesApiDtoCopyWith(CountriesApiDto value, $Res Function(CountriesApiDto) _then) = _$CountriesApiDtoCopyWithImpl;
@useResult
$Res call({
 String country, String iso2
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
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,Object? iso2 = null,}) {
  return _then(_self.copyWith(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String country,  String iso2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
return $default(_that.country,_that.iso2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String country,  String iso2)  $default,) {final _that = this;
switch (_that) {
case _CountriesApiDto():
return $default(_that.country,_that.iso2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String country,  String iso2)?  $default,) {final _that = this;
switch (_that) {
case _CountriesApiDto() when $default != null:
return $default(_that.country,_that.iso2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountriesApiDto implements CountriesApiDto {
  const _CountriesApiDto({required this.country, required this.iso2});
  factory _CountriesApiDto.fromJson(Map<String, dynamic> json) => _$CountriesApiDtoFromJson(json);

@override final  String country;
@override final  String iso2;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountriesApiDto&&(identical(other.country, country) || other.country == country)&&(identical(other.iso2, iso2) || other.iso2 == iso2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,iso2);

@override
String toString() {
  return 'CountriesApiDto(country: $country, iso2: $iso2)';
}


}

/// @nodoc
abstract mixin class _$CountriesApiDtoCopyWith<$Res> implements $CountriesApiDtoCopyWith<$Res> {
  factory _$CountriesApiDtoCopyWith(_CountriesApiDto value, $Res Function(_CountriesApiDto) _then) = __$CountriesApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String country, String iso2
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
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,Object? iso2 = null,}) {
  return _then(_CountriesApiDto(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
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
mixin _$FlagResponseApiDto {

 List<FlagApiDto> get data;
/// Create a copy of FlagResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlagResponseApiDtoCopyWith<FlagResponseApiDto> get copyWith => _$FlagResponseApiDtoCopyWithImpl<FlagResponseApiDto>(this as FlagResponseApiDto, _$identity);

  /// Serializes this FlagResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlagResponseApiDto&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FlagResponseApiDto(data: $data)';
}


}

/// @nodoc
abstract mixin class $FlagResponseApiDtoCopyWith<$Res>  {
  factory $FlagResponseApiDtoCopyWith(FlagResponseApiDto value, $Res Function(FlagResponseApiDto) _then) = _$FlagResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 List<FlagApiDto> data
});




}
/// @nodoc
class _$FlagResponseApiDtoCopyWithImpl<$Res>
    implements $FlagResponseApiDtoCopyWith<$Res> {
  _$FlagResponseApiDtoCopyWithImpl(this._self, this._then);

  final FlagResponseApiDto _self;
  final $Res Function(FlagResponseApiDto) _then;

/// Create a copy of FlagResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FlagApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlagResponseApiDto].
extension FlagResponseApiDtoPatterns on FlagResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlagResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlagResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlagResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _FlagResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlagResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlagResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FlagApiDto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlagResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FlagApiDto> data)  $default,) {final _that = this;
switch (_that) {
case _FlagResponseApiDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FlagApiDto> data)?  $default,) {final _that = this;
switch (_that) {
case _FlagResponseApiDto() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlagResponseApiDto implements FlagResponseApiDto {
  const _FlagResponseApiDto({required final  List<FlagApiDto> data}): _data = data;
  factory _FlagResponseApiDto.fromJson(Map<String, dynamic> json) => _$FlagResponseApiDtoFromJson(json);

 final  List<FlagApiDto> _data;
@override List<FlagApiDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of FlagResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlagResponseApiDtoCopyWith<_FlagResponseApiDto> get copyWith => __$FlagResponseApiDtoCopyWithImpl<_FlagResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlagResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlagResponseApiDto&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'FlagResponseApiDto(data: $data)';
}


}

/// @nodoc
abstract mixin class _$FlagResponseApiDtoCopyWith<$Res> implements $FlagResponseApiDtoCopyWith<$Res> {
  factory _$FlagResponseApiDtoCopyWith(_FlagResponseApiDto value, $Res Function(_FlagResponseApiDto) _then) = __$FlagResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 List<FlagApiDto> data
});




}
/// @nodoc
class __$FlagResponseApiDtoCopyWithImpl<$Res>
    implements _$FlagResponseApiDtoCopyWith<$Res> {
  __$FlagResponseApiDtoCopyWithImpl(this._self, this._then);

  final _FlagResponseApiDto _self;
  final $Res Function(_FlagResponseApiDto) _then;

/// Create a copy of FlagResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_FlagResponseApiDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FlagApiDto>,
  ));
}


}


/// @nodoc
mixin _$FlagApiDto {

 String get name; String get iso2; String get unicodeFlag;
/// Create a copy of FlagApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlagApiDtoCopyWith<FlagApiDto> get copyWith => _$FlagApiDtoCopyWithImpl<FlagApiDto>(this as FlagApiDto, _$identity);

  /// Serializes this FlagApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlagApiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.unicodeFlag, unicodeFlag) || other.unicodeFlag == unicodeFlag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,iso2,unicodeFlag);

@override
String toString() {
  return 'FlagApiDto(name: $name, iso2: $iso2, unicodeFlag: $unicodeFlag)';
}


}

/// @nodoc
abstract mixin class $FlagApiDtoCopyWith<$Res>  {
  factory $FlagApiDtoCopyWith(FlagApiDto value, $Res Function(FlagApiDto) _then) = _$FlagApiDtoCopyWithImpl;
@useResult
$Res call({
 String name, String iso2, String unicodeFlag
});




}
/// @nodoc
class _$FlagApiDtoCopyWithImpl<$Res>
    implements $FlagApiDtoCopyWith<$Res> {
  _$FlagApiDtoCopyWithImpl(this._self, this._then);

  final FlagApiDto _self;
  final $Res Function(FlagApiDto) _then;

/// Create a copy of FlagApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? iso2 = null,Object? unicodeFlag = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,unicodeFlag: null == unicodeFlag ? _self.unicodeFlag : unicodeFlag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FlagApiDto].
extension FlagApiDtoPatterns on FlagApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlagApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlagApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlagApiDto value)  $default,){
final _that = this;
switch (_that) {
case _FlagApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlagApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlagApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String iso2,  String unicodeFlag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlagApiDto() when $default != null:
return $default(_that.name,_that.iso2,_that.unicodeFlag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String iso2,  String unicodeFlag)  $default,) {final _that = this;
switch (_that) {
case _FlagApiDto():
return $default(_that.name,_that.iso2,_that.unicodeFlag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String iso2,  String unicodeFlag)?  $default,) {final _that = this;
switch (_that) {
case _FlagApiDto() when $default != null:
return $default(_that.name,_that.iso2,_that.unicodeFlag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlagApiDto implements FlagApiDto {
  const _FlagApiDto({required this.name, required this.iso2, required this.unicodeFlag});
  factory _FlagApiDto.fromJson(Map<String, dynamic> json) => _$FlagApiDtoFromJson(json);

@override final  String name;
@override final  String iso2;
@override final  String unicodeFlag;

/// Create a copy of FlagApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlagApiDtoCopyWith<_FlagApiDto> get copyWith => __$FlagApiDtoCopyWithImpl<_FlagApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlagApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlagApiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.unicodeFlag, unicodeFlag) || other.unicodeFlag == unicodeFlag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,iso2,unicodeFlag);

@override
String toString() {
  return 'FlagApiDto(name: $name, iso2: $iso2, unicodeFlag: $unicodeFlag)';
}


}

/// @nodoc
abstract mixin class _$FlagApiDtoCopyWith<$Res> implements $FlagApiDtoCopyWith<$Res> {
  factory _$FlagApiDtoCopyWith(_FlagApiDto value, $Res Function(_FlagApiDto) _then) = __$FlagApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String iso2, String unicodeFlag
});




}
/// @nodoc
class __$FlagApiDtoCopyWithImpl<$Res>
    implements _$FlagApiDtoCopyWith<$Res> {
  __$FlagApiDtoCopyWithImpl(this._self, this._then);

  final _FlagApiDto _self;
  final $Res Function(_FlagApiDto) _then;

/// Create a copy of FlagApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? iso2 = null,Object? unicodeFlag = null,}) {
  return _then(_FlagApiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,unicodeFlag: null == unicodeFlag ? _self.unicodeFlag : unicodeFlag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
