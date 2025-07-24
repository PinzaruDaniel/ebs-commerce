
import 'package:data/modules/products/mapper/category_mapper.dart';
import 'package:data/modules/products/mapper/specification_mapper.dart';
import 'package:domain/modules/products/models/product_entity.dart';

import '../models/remote/product_api_dto.dart';


extension ProductApiDtoMapper on ProductApiDto {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      marks: marks,
      price: price,
      stock: stock,
      discount: discount,
      description: description,
      specification: specification?.map((e) => e.toEntity()).toList()?? [],
      category: category?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
