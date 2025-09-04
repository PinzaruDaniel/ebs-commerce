import 'package:data/mapper/category_mapper.dart';
import 'package:data/mapper/specification_mapper.dart';
import 'package:data/modules/products/models/remote/index.dart';
import 'package:domain/modules/products/models/index.dart';

import '../modules/products/models/local/index.dart';

extension ProductApiDtoMapper on ProductApiDto {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      marks: marks,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      stock: stock,
      description: description,
      specification: specification.map((e) => e.toEntity()).toList(),
      category: category?.expand((list) => list).map((e) => e.toEntity()).toList() ?? [],
      brand: brand,
    );
  }

  ProductLocalDto toLocalDto() {
    return ProductLocalDto(
      id: id,
      name: name,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: imageUrl,
      marks: marks,
      stock: stock,
      description: description,
    );
  }
}

extension ProductLocalDtoMapper on ProductLocalDto {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: imageUrl,
      marks: marks,
      stock: stock,
      description: description,
      specification: [],
      category: [],
      brand: null,
    );
  }

  ProductApiDto toApiDto() {
    return ProductApiDto(
      id: id,
      name: name,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: imageUrl,
      marks: marks,
      stock: stock,
      description: description,
      brand: null,
      specification: null,
      category: null,
    );
  }
}

extension ProductEntityMapper on ProductEntity {
  ProductLocalDto toLocalDto() {
    return ProductLocalDto(
      id: id,
      name: name,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: imageUrl,
      marks: marks,
      stock: stock,
      description: description,
    );
  }
}