import 'package:domain/modules/products/models/product_entity.dart';
import 'package:presentation/util/mapper/category_mapper.dart';
import 'package:presentation/util/mapper/specification_mapper.dart';
import 'package:presentation/view/product_view_model.dart';

extension ProductViewModelMapper on ProductEntity {
  ProductViewModel get toModel {
    return ProductViewModel(
      id: id,
      title: name,
      company: brand,
      imageUrl: imageUrl,
      marks: marks,
      price: price,
      stock: stock,
      sale: discount,
      description: description,
      specification: specification.map((e) => e.toModel).toList(),
      category: category.map((e) => e.toModel).toList(),
    );
  }
}
