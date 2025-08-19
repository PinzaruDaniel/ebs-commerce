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

/// @nodoc
mixin _$CountriesEntity {

 String get name; String get iso2;
/// Create a copy of CountriesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountriesEntityCopyWith<CountriesEntity> get copyWith => _$CountriesEntityCopyWithImpl<CountriesEntity>(this as CountriesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountriesEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2));
}


@override
int get hashCode => Object.hash(runtimeType,name,iso2);

@override
String toString() {
  return 'CountriesEntity(name: $name, iso2: $iso2)';
}


}

/// @nodoc
abstract mixin class $CountriesEntityCopyWith<$Res>  {
  factory $CountriesEntityCopyWith(CountriesEntity value, $Res Function(CountriesEntity) _then) = _$CountriesEntityCopyWithImpl;
@useResult
$Res call({
 String name, String iso2
});




}
/// @nodoc
class _$CountriesEntityCopyWithImpl<$Res>
    implements $CountriesEntityCopyWith<$Res> {
  _$CountriesEntityCopyWithImpl(this._self, this._then);

  final CountriesEntity _self;
  final $Res Function(CountriesEntity) _then;

/// Create a copy of CountriesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? iso2 = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CountriesEntity].
extension CountriesEntityPatterns on CountriesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountriesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountriesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountriesEntity value)  $default,){
final _that = this;
switch (_that) {
case _CountriesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountriesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CountriesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String iso2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountriesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String iso2)  $default,) {final _that = this;
switch (_that) {
case _CountriesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String iso2)?  $default,) {final _that = this;
switch (_that) {
case _CountriesEntity() when $default != null:
return $default(_that.name,_that.iso2);case _:
  return null;

}
}

}

/// @nodoc


class _CountriesEntity implements CountriesEntity {
  const _CountriesEntity({required this.name, required this.iso2});
  

@override final  String name;
@override final  String iso2;

/// Create a copy of CountriesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountriesEntityCopyWith<_CountriesEntity> get copyWith => __$CountriesEntityCopyWithImpl<_CountriesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountriesEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.iso2, iso2) || other.iso2 == iso2));
}


@override
int get hashCode => Object.hash(runtimeType,name,iso2);

@override
String toString() {
  return 'CountriesEntity(name: $name, iso2: $iso2)';
}


}

/// @nodoc
abstract mixin class _$CountriesEntityCopyWith<$Res> implements $CountriesEntityCopyWith<$Res> {
  factory _$CountriesEntityCopyWith(_CountriesEntity value, $Res Function(_CountriesEntity) _then) = __$CountriesEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String iso2
});




}
/// @nodoc
class __$CountriesEntityCopyWithImpl<$Res>
    implements _$CountriesEntityCopyWith<$Res> {
  __$CountriesEntityCopyWithImpl(this._self, this._then);

  final _CountriesEntity _self;
  final $Res Function(_CountriesEntity) _then;

/// Create a copy of CountriesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? iso2 = null,}) {
  return _then(_CountriesEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StatesEntity {

 String get name; String get code;
/// Create a copy of StatesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesEntityCopyWith<StatesEntity> get copyWith => _$StatesEntityCopyWithImpl<StatesEntity>(this as StatesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'StatesEntity(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $StatesEntityCopyWith<$Res>  {
  factory $StatesEntityCopyWith(StatesEntity value, $Res Function(StatesEntity) _then) = _$StatesEntityCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$StatesEntityCopyWithImpl<$Res>
    implements $StatesEntityCopyWith<$Res> {
  _$StatesEntityCopyWithImpl(this._self, this._then);

  final StatesEntity _self;
  final $Res Function(StatesEntity) _then;

/// Create a copy of StatesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StatesEntity].
extension StatesEntityPatterns on StatesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatesEntity value)  $default,){
final _that = this;
switch (_that) {
case _StatesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StatesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _StatesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _StatesEntity() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _StatesEntity implements StatesEntity {
  const _StatesEntity({required this.name, required this.code});
  

@override final  String name;
@override final  String code;

/// Create a copy of StatesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatesEntityCopyWith<_StatesEntity> get copyWith => __$StatesEntityCopyWithImpl<_StatesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'StatesEntity(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$StatesEntityCopyWith<$Res> implements $StatesEntityCopyWith<$Res> {
  factory _$StatesEntityCopyWith(_StatesEntity value, $Res Function(_StatesEntity) _then) = __$StatesEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$StatesEntityCopyWithImpl<$Res>
    implements _$StatesEntityCopyWith<$Res> {
  __$StatesEntityCopyWithImpl(this._self, this._then);

  final _StatesEntity _self;
  final $Res Function(_StatesEntity) _then;

/// Create a copy of StatesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_StatesEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
