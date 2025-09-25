import 'dart:convert';
import 'package:data/mapper/category_mapper.dart';
import 'package:data/mapper/specification_mapper.dart';
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
extension ProductEntityToBoxMapper on ProductEntity{
  ProductBox get toBox {
    return ProductBox(
        idProduct: id,
        name: name,
        price: price,
        discount: discount,
        discountedPrice: discountedPrice,
        imageUrl: jsonEncode(imageUrl),
        marks: jsonEncode(marks),
        stock: stock,
        description: description);
  }
}
extension ProductBoxToEntityMapper on ProductBox{
  ProductEntity toEntity() {
    return ProductEntity(
        id: idProduct,
        name: name,
        brand: null,
        price: price,
        discount: discount,
        discountedPrice: discountedPrice,
        imageUrl: (imageUrl != null && imageUrl!.isNotEmpty)
            ? List<String>.from(jsonDecode(imageUrl!) ?? [])
            : [],

        marks: (marks != null && marks!.isNotEmpty)
            ? List<String>.from(jsonDecode(marks!) ?? [])
            : [],
        stock: stock,
        description: description,
        specification: [],
        category: []);
  }
}
/*

extension ProductEntityToBoxMapper on ProductEntity{
  ProductBox toBox() {
    return ProductBox(id: id,
        name: name,
        price: price,
        discount: discount,
        discountedPrice: discountedPrice,
        imageUrl: jsonEncode(imageUrl),
        marks: jsonEncode(marks),
        stock: stock,
        description: description);
  }
}

extension ProductBoxToEntityMapper on ProductBox{
  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        name: name,
        brand: null,
        price: price,
        discount: discount,
        discountedPrice: discountedPrice,
        imageUrl: imageUrl!=null?List<String>.from(jsonDecode(imageUrl!)):[],
        marks: marks!=null?List<String>.from(jsonDecode(marks!)):[],
        stock: stock,
        description: description,
        specification: [],
        category: []);
  }
}*/
