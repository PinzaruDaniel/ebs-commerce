import 'dart:convert';
import 'package:data/mapper/category_mapper.dart';
import 'package:data/mapper/specification_mapper.dart';
import 'package:data/modules/products/models/local/order_box.dart';
import 'package:data/modules/products/models/local/ordered_product_box.dart';
import 'package:domain/modules/products/models/index.dart';
import '../modules/products/models/local/product_box.dart';
import '../modules/products/models/remote/index.dart';

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
}

extension ProductEntityToBoxMapper on ProductEntity {
  ProductBox get toBox {
    final box = ProductBox(
      idProduct: id,
      name: name,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: imageUrl != null ? jsonEncode(imageUrl) : null,
      marks: marks != null ? jsonEncode(marks) : null,
      stock: stock,
      description: description,
    );

    if (specification != null) {
      box.specifications.clear();
      box.specifications.addAll(
        specification!.map((e) {
          final specBox = e.toBox;
          specBox.product.target = box;
          return specBox;
        }),
      );
    }

    if (category != null) {
      box.categories.clear();
      box.categories.addAll(
        category!.map((e) {
          final categoryBox = e.toBox;
          categoryBox.product.target = box;
          return categoryBox;
        }),
      );
    }

    return box;
  }
}

extension ProductBoxToEntityMapper on ProductBox {
  ProductEntity get toEntity {
    return ProductEntity(
      id: idProduct,
      name: name,
      brand: null,
      price: price,
      discount: discount,
      discountedPrice: discountedPrice,
      imageUrl: (imageUrl != null && imageUrl!.isNotEmpty) ? List<String>.from(jsonDecode(imageUrl!) ?? []) : [],
      marks: (marks != null && marks!.isNotEmpty) ? List<String>.from(jsonDecode(marks!) ?? []) : [],
      stock: stock,
      description: description,
      specification: specifications.map((e) => e.toEntity).toList(),
      category: categories.map((e) => e.toEntity).toList(),
    );
  }
}

extension OrderedProductBoxToEntity on OrderedProductBox {
  OrderedProductEntity get toEntity {
    return OrderedProductEntity(
      idProduct: idProduct,
      title: title,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}

extension OrderedProductToBoxEntity on OrderedProductEntity {
  OrderedProductBox get toBox {
    return OrderedProductBox(idProduct: idProduct, title: title, imageUrl: imageUrl, price: price, quantity: quantity);
  }
}

extension OrderToEntity on OrderBox {
  OrderEntity get toEntity {
    return OrderEntity(id: id, dateTime: dateTime, products: products.map((p) => p.toEntity).toList());
  }
}

extension OrderToBox on OrderEntity {
  OrderBox get toBox {
    final box = OrderBox(id: id, dateTime: dateTime);
    box.products.addAll(products.map((p) => p.toBox));
    return box;
  }
}
