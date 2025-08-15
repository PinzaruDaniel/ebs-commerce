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
mixin _$StatesEntity {

 String get name;
/// Create a copy of StatesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatesEntityCopyWith<StatesEntity> get copyWith => _$StatesEntityCopyWithImpl<StatesEntity>(this as StatesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatesEntity&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'StatesEntity(name: $name)';
}


}

/// @nodoc
abstract mixin class $StatesEntityCopyWith<$Res>  {
  factory $StatesEntityCopyWith(StatesEntity value, $Res Function(StatesEntity) _then) = _$StatesEntityCopyWithImpl;
@useResult
$Res call({
 String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatesEntity() when $default != null:
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
case _StatesEntity():
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
case _StatesEntity() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _StatesEntity implements StatesEntity {
  const _StatesEntity({required this.name});
  

@override final  String name;

/// Create a copy of StatesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatesEntityCopyWith<_StatesEntity> get copyWith => __$StatesEntityCopyWithImpl<_StatesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatesEntity&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'StatesEntity(name: $name)';
}


}

/// @nodoc
abstract mixin class _$StatesEntityCopyWith<$Res> implements $StatesEntityCopyWith<$Res> {
  factory _$StatesEntityCopyWith(_StatesEntity value, $Res Function(_StatesEntity) _then) = __$StatesEntityCopyWithImpl;
@override @useResult
$Res call({
 String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_StatesEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
