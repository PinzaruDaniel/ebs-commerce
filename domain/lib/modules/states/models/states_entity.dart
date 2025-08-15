part of 'index.dart';

@freezed
abstract class StatesEntity with _$StatesEntity{
  const factory StatesEntity({
    required String name,
  }) =_StatesEntity;
}