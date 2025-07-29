import 'package:data/mapper/category_mapper.dart';
import 'package:data/modules/categories/models/remote/index.dart';
import 'package:domain/modules/categories/models/index.dart';

extension CategoryResponseMapper on CategoryResponseApiDto{
  List<CategoryEntity> toEntity(){
    return results.map((dto)=>dto.toEntity()).toList();
  }
}