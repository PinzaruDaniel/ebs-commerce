import 'package:data/mapper/product_mapper.dart';
import 'package:data/modules/products/models/local/product_response_box.dart';
import 'package:domain/modules/products/models/index.dart';

import '../modules/products/models/remote/index.dart';

extension ProductResponseEntityMapper on ProductResponseApiDto {
  ProductResponseEntity get toEntity {
    return ProductResponseEntity(
      count: count,
      totalPages: totalPages,
      perPage: perPage,
      currentPage: currentPage,
      response: results.map((dto) => dto.toEntity()).toList(),
    );
  }
}

extension ProductResponseEntityToBoxMapper on ProductResponseEntity {
  ProductResponseBox get toBox {
    final productResponseBox = ProductResponseBox(
      pageId: currentPage,
      count: count,
      totalPages: totalPages ?? 0,
      perPage: perPage,
    );
   /* productResponseBox.products.addAll(
      response.map((e) {
        final productBox = e.toBox;
        productBox.productsResponse.target = productResponseBox;
        return productBox;
      }),
    );*/
    return productResponseBox;
  }
}

extension ProductResponseBoxToEntityMapper on ProductResponseBox {
  ProductResponseEntity get toEntity {
    return ProductResponseEntity(
      count: count,
      totalPages: totalPages,
      perPage: perPage,
      currentPage: pageId,
      response: products.map((e) => e.toEntity).toList(),
    );
  }
}
