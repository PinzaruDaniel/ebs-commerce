part of '../index.dart';

@freezed
abstract class StatesEntity with _$StatesEntity{
  const factory StatesEntity({
    required int id,
    required String name,
    required String code,
  }) =_StatesEntity;
}