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
mixin _$UserEntity {

 int? get id; String get name; String get surname; String? get number; String? get dialCode; String get email; String? get imageUrl; DeliveryAddressEntity? get deliveryAddressEntity; PaymentMethodEntity? get paymentMethodEntity;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.number, number) || other.number == number)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.deliveryAddressEntity, deliveryAddressEntity) || other.deliveryAddressEntity == deliveryAddressEntity)&&(identical(other.paymentMethodEntity, paymentMethodEntity) || other.paymentMethodEntity == paymentMethodEntity));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,number,dialCode,email,imageUrl,deliveryAddressEntity,paymentMethodEntity);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, surname: $surname, number: $number, dialCode: $dialCode, email: $email, imageUrl: $imageUrl, deliveryAddressEntity: $deliveryAddressEntity, paymentMethodEntity: $paymentMethodEntity)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String name, String surname, String? number, String? dialCode, String email, String? imageUrl, DeliveryAddressEntity? deliveryAddressEntity, PaymentMethodEntity? paymentMethodEntity
});


$DeliveryAddressEntityCopyWith<$Res>? get deliveryAddressEntity;$PaymentMethodEntityCopyWith<$Res>? get paymentMethodEntity;

}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? surname = null,Object? number = freezed,Object? dialCode = freezed,Object? email = null,Object? imageUrl = freezed,Object? deliveryAddressEntity = freezed,Object? paymentMethodEntity = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddressEntity: freezed == deliveryAddressEntity ? _self.deliveryAddressEntity : deliveryAddressEntity // ignore: cast_nullable_to_non_nullable
as DeliveryAddressEntity?,paymentMethodEntity: freezed == paymentMethodEntity ? _self.paymentMethodEntity : paymentMethodEntity // ignore: cast_nullable_to_non_nullable
as PaymentMethodEntity?,
  ));
}
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressEntityCopyWith<$Res>? get deliveryAddressEntity {
    if (_self.deliveryAddressEntity == null) {
    return null;
  }

  return $DeliveryAddressEntityCopyWith<$Res>(_self.deliveryAddressEntity!, (value) {
    return _then(_self.copyWith(deliveryAddressEntity: value));
  });
}/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodEntityCopyWith<$Res>? get paymentMethodEntity {
    if (_self.paymentMethodEntity == null) {
    return null;
  }

  return $PaymentMethodEntityCopyWith<$Res>(_self.paymentMethodEntity!, (value) {
    return _then(_self.copyWith(paymentMethodEntity: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  String surname,  String? number,  String? dialCode,  String email,  String? imageUrl,  DeliveryAddressEntity? deliveryAddressEntity,  PaymentMethodEntity? paymentMethodEntity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.number,_that.dialCode,_that.email,_that.imageUrl,_that.deliveryAddressEntity,_that.paymentMethodEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  String surname,  String? number,  String? dialCode,  String email,  String? imageUrl,  DeliveryAddressEntity? deliveryAddressEntity,  PaymentMethodEntity? paymentMethodEntity)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.name,_that.surname,_that.number,_that.dialCode,_that.email,_that.imageUrl,_that.deliveryAddressEntity,_that.paymentMethodEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  String surname,  String? number,  String? dialCode,  String email,  String? imageUrl,  DeliveryAddressEntity? deliveryAddressEntity,  PaymentMethodEntity? paymentMethodEntity)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.number,_that.dialCode,_that.email,_that.imageUrl,_that.deliveryAddressEntity,_that.paymentMethodEntity);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({this.id, required this.name, required this.surname, required this.number, required this.dialCode, required this.email, required this.imageUrl, required this.deliveryAddressEntity, required this.paymentMethodEntity});
  

@override final  int? id;
@override final  String name;
@override final  String surname;
@override final  String? number;
@override final  String? dialCode;
@override final  String email;
@override final  String? imageUrl;
@override final  DeliveryAddressEntity? deliveryAddressEntity;
@override final  PaymentMethodEntity? paymentMethodEntity;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.number, number) || other.number == number)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.deliveryAddressEntity, deliveryAddressEntity) || other.deliveryAddressEntity == deliveryAddressEntity)&&(identical(other.paymentMethodEntity, paymentMethodEntity) || other.paymentMethodEntity == paymentMethodEntity));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,number,dialCode,email,imageUrl,deliveryAddressEntity,paymentMethodEntity);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, surname: $surname, number: $number, dialCode: $dialCode, email: $email, imageUrl: $imageUrl, deliveryAddressEntity: $deliveryAddressEntity, paymentMethodEntity: $paymentMethodEntity)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, String surname, String? number, String? dialCode, String email, String? imageUrl, DeliveryAddressEntity? deliveryAddressEntity, PaymentMethodEntity? paymentMethodEntity
});


@override $DeliveryAddressEntityCopyWith<$Res>? get deliveryAddressEntity;@override $PaymentMethodEntityCopyWith<$Res>? get paymentMethodEntity;

}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? surname = null,Object? number = freezed,Object? dialCode = freezed,Object? email = null,Object? imageUrl = freezed,Object? deliveryAddressEntity = freezed,Object? paymentMethodEntity = freezed,}) {
  return _then(_UserEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddressEntity: freezed == deliveryAddressEntity ? _self.deliveryAddressEntity : deliveryAddressEntity // ignore: cast_nullable_to_non_nullable
as DeliveryAddressEntity?,paymentMethodEntity: freezed == paymentMethodEntity ? _self.paymentMethodEntity : paymentMethodEntity // ignore: cast_nullable_to_non_nullable
as PaymentMethodEntity?,
  ));
}

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressEntityCopyWith<$Res>? get deliveryAddressEntity {
    if (_self.deliveryAddressEntity == null) {
    return null;
  }

  return $DeliveryAddressEntityCopyWith<$Res>(_self.deliveryAddressEntity!, (value) {
    return _then(_self.copyWith(deliveryAddressEntity: value));
  });
}/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodEntityCopyWith<$Res>? get paymentMethodEntity {
    if (_self.paymentMethodEntity == null) {
    return null;
  }

  return $PaymentMethodEntityCopyWith<$Res>(_self.paymentMethodEntity!, (value) {
    return _then(_self.copyWith(paymentMethodEntity: value));
  });
}
}

// dart format on
