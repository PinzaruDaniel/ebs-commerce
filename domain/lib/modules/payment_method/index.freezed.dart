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
mixin _$PaymentMethodEntity {

 int? get id; String get key; String get titleKey;
/// Create a copy of PaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodEntityCopyWith<PaymentMethodEntity> get copyWith => _$PaymentMethodEntityCopyWithImpl<PaymentMethodEntity>(this as PaymentMethodEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey));
}


@override
int get hashCode => Object.hash(runtimeType,id,key,titleKey);

@override
String toString() {
  return 'PaymentMethodEntity(id: $id, key: $key, titleKey: $titleKey)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodEntityCopyWith<$Res>  {
  factory $PaymentMethodEntityCopyWith(PaymentMethodEntity value, $Res Function(PaymentMethodEntity) _then) = _$PaymentMethodEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String key, String titleKey
});




}
/// @nodoc
class _$PaymentMethodEntityCopyWithImpl<$Res>
    implements $PaymentMethodEntityCopyWith<$Res> {
  _$PaymentMethodEntityCopyWithImpl(this._self, this._then);

  final PaymentMethodEntity _self;
  final $Res Function(PaymentMethodEntity) _then;

/// Create a copy of PaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? key = null,Object? titleKey = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodEntity].
extension PaymentMethodEntityPatterns on PaymentMethodEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodEntity value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String key,  String titleKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodEntity() when $default != null:
return $default(_that.id,_that.key,_that.titleKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String key,  String titleKey)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodEntity():
return $default(_that.id,_that.key,_that.titleKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String key,  String titleKey)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodEntity() when $default != null:
return $default(_that.id,_that.key,_that.titleKey);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentMethodEntity implements PaymentMethodEntity {
  const _PaymentMethodEntity({this.id, required this.key, required this.titleKey});
  

@override final  int? id;
@override final  String key;
@override final  String titleKey;

/// Create a copy of PaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodEntityCopyWith<_PaymentMethodEntity> get copyWith => __$PaymentMethodEntityCopyWithImpl<_PaymentMethodEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey));
}


@override
int get hashCode => Object.hash(runtimeType,id,key,titleKey);

@override
String toString() {
  return 'PaymentMethodEntity(id: $id, key: $key, titleKey: $titleKey)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodEntityCopyWith<$Res> implements $PaymentMethodEntityCopyWith<$Res> {
  factory _$PaymentMethodEntityCopyWith(_PaymentMethodEntity value, $Res Function(_PaymentMethodEntity) _then) = __$PaymentMethodEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String key, String titleKey
});




}
/// @nodoc
class __$PaymentMethodEntityCopyWithImpl<$Res>
    implements _$PaymentMethodEntityCopyWith<$Res> {
  __$PaymentMethodEntityCopyWithImpl(this._self, this._then);

  final _PaymentMethodEntity _self;
  final $Res Function(_PaymentMethodEntity) _then;

/// Create a copy of PaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? key = null,Object? titleKey = null,}) {
  return _then(_PaymentMethodEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
