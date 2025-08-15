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

// dart format on
