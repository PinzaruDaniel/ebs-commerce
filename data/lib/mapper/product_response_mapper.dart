import 'package:data/mapper/product_mapper.dart';
import 'package:domain/modules/products/models/index.dart';

import '../modules/products/models/remote/index.dart';

extension ProductResponseEntityMapper on ProductResponseApiDto {
  ProductResponseEntity toEntity() {
    return ProductResponseEntity(
      count: count,
      totalPages: totalPages,
      perPage: perPage,
      currentPage: currentPage,
      response: results.map((dto) => dto.toEntity()).toList(),
    );
  }
}
