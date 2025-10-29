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
mixin _$DeliveryAddressEntity {

 int? get id; String get deliveryType; String? get comments; String? get pickupLocation; String? get country; String? get region; String? get city; String? get postalCode; String? get address;
/// Create a copy of DeliveryAddressEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAddressEntityCopyWith<DeliveryAddressEntity> get copyWith => _$DeliveryAddressEntityCopyWithImpl<DeliveryAddressEntity>(this as DeliveryAddressEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAddressEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,deliveryType,comments,pickupLocation,country,region,city,postalCode,address);

@override
String toString() {
  return 'DeliveryAddressEntity(id: $id, deliveryType: $deliveryType, comments: $comments, pickupLocation: $pickupLocation, country: $country, region: $region, city: $city, postalCode: $postalCode, address: $address)';
}


}

/// @nodoc
abstract mixin class $DeliveryAddressEntityCopyWith<$Res>  {
  factory $DeliveryAddressEntityCopyWith(DeliveryAddressEntity value, $Res Function(DeliveryAddressEntity) _then) = _$DeliveryAddressEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String deliveryType, String? comments, String? pickupLocation, String? country, String? region, String? city, String? postalCode, String? address
});




}
/// @nodoc
class _$DeliveryAddressEntityCopyWithImpl<$Res>
    implements $DeliveryAddressEntityCopyWith<$Res> {
  _$DeliveryAddressEntityCopyWithImpl(this._self, this._then);

  final DeliveryAddressEntity _self;
  final $Res Function(DeliveryAddressEntity) _then;

/// Create a copy of DeliveryAddressEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? deliveryType = null,Object? comments = freezed,Object? pickupLocation = freezed,Object? country = freezed,Object? region = freezed,Object? city = freezed,Object? postalCode = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,pickupLocation: freezed == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryAddressEntity].
extension DeliveryAddressEntityPatterns on DeliveryAddressEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryAddressEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryAddressEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryAddressEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryAddressEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddressEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String deliveryType,  String? comments,  String? pickupLocation,  String? country,  String? region,  String? city,  String? postalCode,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryAddressEntity() when $default != null:
return $default(_that.id,_that.deliveryType,_that.comments,_that.pickupLocation,_that.country,_that.region,_that.city,_that.postalCode,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String deliveryType,  String? comments,  String? pickupLocation,  String? country,  String? region,  String? city,  String? postalCode,  String? address)  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddressEntity():
return $default(_that.id,_that.deliveryType,_that.comments,_that.pickupLocation,_that.country,_that.region,_that.city,_that.postalCode,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String deliveryType,  String? comments,  String? pickupLocation,  String? country,  String? region,  String? city,  String? postalCode,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddressEntity() when $default != null:
return $default(_that.id,_that.deliveryType,_that.comments,_that.pickupLocation,_that.country,_that.region,_that.city,_that.postalCode,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _DeliveryAddressEntity implements DeliveryAddressEntity {
  const _DeliveryAddressEntity({this.id, required this.deliveryType, required this.comments, required this.pickupLocation, required this.country, required this.region, required this.city, required this.postalCode, required this.address});
  

@override final  int? id;
@override final  String deliveryType;
@override final  String? comments;
@override final  String? pickupLocation;
@override final  String? country;
@override final  String? region;
@override final  String? city;
@override final  String? postalCode;
@override final  String? address;

/// Create a copy of DeliveryAddressEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAddressEntityCopyWith<_DeliveryAddressEntity> get copyWith => __$DeliveryAddressEntityCopyWithImpl<_DeliveryAddressEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAddressEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,deliveryType,comments,pickupLocation,country,region,city,postalCode,address);

@override
String toString() {
  return 'DeliveryAddressEntity(id: $id, deliveryType: $deliveryType, comments: $comments, pickupLocation: $pickupLocation, country: $country, region: $region, city: $city, postalCode: $postalCode, address: $address)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAddressEntityCopyWith<$Res> implements $DeliveryAddressEntityCopyWith<$Res> {
  factory _$DeliveryAddressEntityCopyWith(_DeliveryAddressEntity value, $Res Function(_DeliveryAddressEntity) _then) = __$DeliveryAddressEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String deliveryType, String? comments, String? pickupLocation, String? country, String? region, String? city, String? postalCode, String? address
});




}
/// @nodoc
class __$DeliveryAddressEntityCopyWithImpl<$Res>
    implements _$DeliveryAddressEntityCopyWith<$Res> {
  __$DeliveryAddressEntityCopyWithImpl(this._self, this._then);

  final _DeliveryAddressEntity _self;
  final $Res Function(_DeliveryAddressEntity) _then;

/// Create a copy of DeliveryAddressEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? deliveryType = null,Object? comments = freezed,Object? pickupLocation = freezed,Object? country = freezed,Object? region = freezed,Object? city = freezed,Object? postalCode = freezed,Object? address = freezed,}) {
  return _then(_DeliveryAddressEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,pickupLocation: freezed == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

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

/// @nodoc
mixin _$UserEntity {

 int? get id; String get name; String get surname; String get number; String get dialCode; String get email; DeliveryAddressEntity? get deliveryAddressEntity; PaymentMethodEntity? get paymentMethodEntity;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.number, number) || other.number == number)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.deliveryAddressEntity, deliveryAddressEntity) || other.deliveryAddressEntity == deliveryAddressEntity)&&(identical(other.paymentMethodEntity, paymentMethodEntity) || other.paymentMethodEntity == paymentMethodEntity));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,number,dialCode,email,deliveryAddressEntity,paymentMethodEntity);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, surname: $surname, number: $number, dialCode: $dialCode, email: $email, deliveryAddressEntity: $deliveryAddressEntity, paymentMethodEntity: $paymentMethodEntity)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String name, String surname, String number, String dialCode, String email, DeliveryAddressEntity? deliveryAddressEntity, PaymentMethodEntity? paymentMethodEntity
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? surname = null,Object? number = null,Object? dialCode = null,Object? email = null,Object? deliveryAddressEntity = freezed,Object? paymentMethodEntity = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressEntity: freezed == deliveryAddressEntity ? _self.deliveryAddressEntity : deliveryAddressEntity // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  String surname,  String number,  String dialCode,  String email,  DeliveryAddressEntity? deliveryAddressEntity,  PaymentMethodEntity? paymentMethodEntity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.number,_that.dialCode,_that.email,_that.deliveryAddressEntity,_that.paymentMethodEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  String surname,  String number,  String dialCode,  String email,  DeliveryAddressEntity? deliveryAddressEntity,  PaymentMethodEntity? paymentMethodEntity)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.name,_that.surname,_that.number,_that.dialCode,_that.email,_that.deliveryAddressEntity,_that.paymentMethodEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  String surname,  String number,  String dialCode,  String email,  DeliveryAddressEntity? deliveryAddressEntity,  PaymentMethodEntity? paymentMethodEntity)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.number,_that.dialCode,_that.email,_that.deliveryAddressEntity,_that.paymentMethodEntity);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({this.id, required this.name, required this.surname, required this.number, required this.dialCode, required this.email, required this.deliveryAddressEntity, required this.paymentMethodEntity});
  

@override final  int? id;
@override final  String name;
@override final  String surname;
@override final  String number;
@override final  String dialCode;
@override final  String email;
@override final  DeliveryAddressEntity? deliveryAddressEntity;
@override final  PaymentMethodEntity? paymentMethodEntity;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.number, number) || other.number == number)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.deliveryAddressEntity, deliveryAddressEntity) || other.deliveryAddressEntity == deliveryAddressEntity)&&(identical(other.paymentMethodEntity, paymentMethodEntity) || other.paymentMethodEntity == paymentMethodEntity));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,number,dialCode,email,deliveryAddressEntity,paymentMethodEntity);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, surname: $surname, number: $number, dialCode: $dialCode, email: $email, deliveryAddressEntity: $deliveryAddressEntity, paymentMethodEntity: $paymentMethodEntity)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, String surname, String number, String dialCode, String email, DeliveryAddressEntity? deliveryAddressEntity, PaymentMethodEntity? paymentMethodEntity
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? surname = null,Object? number = null,Object? dialCode = null,Object? email = null,Object? deliveryAddressEntity = freezed,Object? paymentMethodEntity = freezed,}) {
  return _then(_UserEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressEntity: freezed == deliveryAddressEntity ? _self.deliveryAddressEntity : deliveryAddressEntity // ignore: cast_nullable_to_non_nullable
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
