
import 'package:data/mapper/category_mapper.dart';
import 'package:data/mapper/specification_mapper.dart';
import 'package:domain/modules/products/models/index.dart';
import '../modules/products/models/remote/index.dart';

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
      brand: brand,
    );
  }
}
