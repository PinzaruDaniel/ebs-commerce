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
mixin _$CitiesResponseEntity {

 bool get error; String get msg; List<String> get data;
/// Create a copy of CitiesResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitiesResponseEntityCopyWith<CitiesResponseEntity> get copyWith => _$CitiesResponseEntityCopyWithImpl<CitiesResponseEntity>(this as CitiesResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitiesResponseEntity&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,error,msg,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CitiesResponseEntity(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class $CitiesResponseEntityCopyWith<$Res>  {
  factory $CitiesResponseEntityCopyWith(CitiesResponseEntity value, $Res Function(CitiesResponseEntity) _then) = _$CitiesResponseEntityCopyWithImpl;
@useResult
$Res call({
 bool error, String msg, List<String> data
});




}
/// @nodoc
class _$CitiesResponseEntityCopyWithImpl<$Res>
    implements $CitiesResponseEntityCopyWith<$Res> {
  _$CitiesResponseEntityCopyWithImpl(this._self, this._then);

  final CitiesResponseEntity _self;
  final $Res Function(CitiesResponseEntity) _then;

/// Create a copy of CitiesResponseEntity
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


/// Adds pattern-matching-related methods to [CitiesResponseEntity].
extension CitiesResponseEntityPatterns on CitiesResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CitiesResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CitiesResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CitiesResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _CitiesResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CitiesResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CitiesResponseEntity() when $default != null:
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
case _CitiesResponseEntity() when $default != null:
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
case _CitiesResponseEntity():
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
case _CitiesResponseEntity() when $default != null:
return $default(_that.error,_that.msg,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _CitiesResponseEntity implements CitiesResponseEntity {
  const _CitiesResponseEntity({required this.error, required this.msg, required final  List<String> data}): _data = data;
  

@override final  bool error;
@override final  String msg;
 final  List<String> _data;
@override List<String> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CitiesResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CitiesResponseEntityCopyWith<_CitiesResponseEntity> get copyWith => __$CitiesResponseEntityCopyWithImpl<_CitiesResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CitiesResponseEntity&&(identical(other.error, error) || other.error == error)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,error,msg,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CitiesResponseEntity(error: $error, msg: $msg, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CitiesResponseEntityCopyWith<$Res> implements $CitiesResponseEntityCopyWith<$Res> {
  factory _$CitiesResponseEntityCopyWith(_CitiesResponseEntity value, $Res Function(_CitiesResponseEntity) _then) = __$CitiesResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 bool error, String msg, List<String> data
});




}
/// @nodoc
class __$CitiesResponseEntityCopyWithImpl<$Res>
    implements _$CitiesResponseEntityCopyWith<$Res> {
  __$CitiesResponseEntityCopyWithImpl(this._self, this._then);

  final _CitiesResponseEntity _self;
  final $Res Function(_CitiesResponseEntity) _then;

/// Create a copy of CitiesResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? msg = null,Object? data = null,}) {
  return _then(_CitiesResponseEntity(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
