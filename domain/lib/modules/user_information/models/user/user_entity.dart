part of '../index.dart';

@freezed
abstract class UserEntity with _$UserEntity{
  const factory UserEntity({
    required int id,
    required String name,
    required String surname,
    required String number,
    required String dialCode,
    required String email,
})=_UserEntity;
}