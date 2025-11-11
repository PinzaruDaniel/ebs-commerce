import 'package:domain/modules/products/models/index.dart';
import 'package:presentation/util/mapper/category_mapper.dart';
import 'package:presentation/util/mapper/specification_mapper.dart';
import 'package:presentation/view/cart_products_view_model.dart';
import 'package:presentation/view/ordered_products_view_model.dart';
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
      discount: discount,
      discountedPrice: discountedPrice,
      stock: stock,
      description: description,
      specification: specification!.map((e) => e.toModel).toList(),
      category: category?.map((e) => e.toModel).toList() ?? [],
    );
  }
}

extension ProductMapper on ProductViewModel {
  ProductEntity get toEntity {
    return ProductEntity(
      id: id,
      name: title,
      brand: company,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: imageUrl,
      marks: marks,
      stock: stock,
      description: description,
      specification: specification.map((e) => e.toEntity).toList(),
      category: category.map((e) => e.toEntity).toList(),
    );
  }
}

extension CartProductsToOrdered on CartViewModel {
  OrderedProductsViewModel get toOrderedProducts {
    String? priceOrdered;
    if (discountedPrice != null) {
      priceOrdered = discountedPrice;
    } else {
      priceOrdered = price;
    }
    return OrderedProductsViewModel(
      id: id,
      title: title,
      imageUrl: imageUrl,
      price: priceOrdered,
      dateTime: DateTime.now(),
    );
  }
}
