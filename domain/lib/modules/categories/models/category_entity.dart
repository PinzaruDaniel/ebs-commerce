
part of 'index.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity{
   const factory CategoryEntity({
    required int id,
    required String name,
})=_CategoryEntity;
}