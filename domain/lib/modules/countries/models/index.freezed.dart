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
mixin _$CountriesEntity {

 String get name; String? get iso2;
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
 String name, String? iso2
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? iso2 = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? iso2)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? iso2)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? iso2)?  $default,) {final _that = this;
switch (_that) {
case _CountriesEntity() when $default != null:
return $default(_that.name,_that.iso2);case _:
  return null;

}
}

}

/// @nodoc


class _CountriesEntity implements CountriesEntity {
  const _CountriesEntity({required this.name, this.iso2});
  

@override final  String name;
@override final  String? iso2;

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
 String name, String? iso2
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? iso2 = freezed,}) {
  return _then(_CountriesEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
