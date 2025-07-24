import 'package:data/modules/products/mapper/product_mapper.dart';
import 'package:data/modules/products/models/remote/product_response_api_dto.dart';
import 'package:domain/modules/products/models/product_entity.dart';

extension ProductResponseMapper on ProductResponseApiDto{
  List<ProductEntity> toEntity(){
    return results.map((dto)=>dto.toEntity()).toList();
  }

}