// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserApiDto _$UserApiDtoFromJson(Map<String, dynamic> json) => _UserApiDto(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$UserApiDtoToJson(_UserApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
    };
