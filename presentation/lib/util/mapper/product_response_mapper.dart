import 'package:domain/modules/products/models/index.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_response_view_model.dart';

extension ProductResponseMapper on ProductResponseEntity {
  ProductResponseViewModel get toModel {
    return ProductResponseViewModel(
      count: count,
      totalPages: totalPages,
      perPage: perPage,
      response: response.map((e) => e.toModel).toList(),
    );
  }
}
