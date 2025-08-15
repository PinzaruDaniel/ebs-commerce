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

 String get name;
/// Create a copy of StatesApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesApiDtoCopyWith<StatesApiDto> get copyWith => _$StatesApiDtoCopyWithImpl<StatesApiDto>(this as StatesApiDto, _$identity);

  /// Serializes this StatesApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesApiDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'StatesApiDto(name: $name)';
}


}

/// @nodoc
abstract mixin class $StatesApiDtoCopyWith<$Res>  {
  factory $StatesApiDtoCopyWith(StatesApiDto value, $Res Function(StatesApiDto) _then) = _$StatesApiDtoCopyWithImpl;
@useResult
$Res call({
 String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesApiDto() when $default != null:
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
case _StatesApiDto():
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
case _StatesApiDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatesApiDto implements StatesApiDto {
  const _StatesApiDto({required this.name});
  factory _StatesApiDto.fromJson(Map<String, dynamic> json) => _$StatesApiDtoFromJson(json);

@override final  String name;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesApiDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'StatesApiDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$StatesApiDtoCopyWith<$Res> implements $StatesApiDtoCopyWith<$Res> {
  factory _$StatesApiDtoCopyWith(_StatesApiDto value, $Res Function(_StatesApiDto) _then) = __$StatesApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_StatesApiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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

// dart format on
