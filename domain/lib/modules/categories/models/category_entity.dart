
part of 'index.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity{
   const factory CategoryEntity({
    required int id,
    required String name,
     required int level,
     required int? parent
})=_CategoryEntity;
}