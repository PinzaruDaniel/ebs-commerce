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
mixin _$UserApiDto {

 int get id; String get firstName; String get lastName; String get email; String? get imageUrl;
/// Create a copy of UserApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserApiDtoCopyWith<UserApiDto> get copyWith => _$UserApiDtoCopyWithImpl<UserApiDto>(this as UserApiDto, _$identity);

  /// Serializes this UserApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,imageUrl);

@override
String toString() {
  return 'UserApiDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $UserApiDtoCopyWith<$Res>  {
  factory $UserApiDtoCopyWith(UserApiDto value, $Res Function(UserApiDto) _then) = _$UserApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String lastName, String email, String? imageUrl
});




}
/// @nodoc
class _$UserApiDtoCopyWithImpl<$Res>
    implements $UserApiDtoCopyWith<$Res> {
  _$UserApiDtoCopyWithImpl(this._self, this._then);

  final UserApiDto _self;
  final $Res Function(UserApiDto) _then;

/// Create a copy of UserApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserApiDto].
extension UserApiDtoPatterns on UserApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserApiDto value)  $default,){
final _that = this;
switch (_that) {
case _UserApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String email,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserApiDto() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String email,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _UserApiDto():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String lastName,  String email,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserApiDto() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserApiDto implements UserApiDto {
  const _UserApiDto({required this.id, required this.firstName, required this.lastName, required this.email, this.imageUrl});
  factory _UserApiDto.fromJson(Map<String, dynamic> json) => _$UserApiDtoFromJson(json);

@override final  int id;
@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String? imageUrl;

/// Create a copy of UserApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserApiDtoCopyWith<_UserApiDto> get copyWith => __$UserApiDtoCopyWithImpl<_UserApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,imageUrl);

@override
String toString() {
  return 'UserApiDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$UserApiDtoCopyWith<$Res> implements $UserApiDtoCopyWith<$Res> {
  factory _$UserApiDtoCopyWith(_UserApiDto value, $Res Function(_UserApiDto) _then) = __$UserApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String lastName, String email, String? imageUrl
});




}
/// @nodoc
class __$UserApiDtoCopyWithImpl<$Res>
    implements _$UserApiDtoCopyWith<$Res> {
  __$UserApiDtoCopyWithImpl(this._self, this._then);

  final _UserApiDto _self;
  final $Res Function(_UserApiDto) _then;

/// Create a copy of UserApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? imageUrl = freezed,}) {
  return _then(_UserApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
