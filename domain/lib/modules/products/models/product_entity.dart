// Freezed cu ajutorul lui

import 'package:presentation/util/mapper/category_mapper.dart';
import 'package:presentation/util/mapper/specification_mapper.dart';
import 'package:presentation/view/product_view_model.dart';

import 'specification_entity.dart';

import 'category_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final String? brand;
  final List<String>? imageUrl;
  final List<String>? marks;
  final String? price;
  final int? stock;
  final int? discount;
  final String? description;
  final List<SpecificationEntity> specification;
  final List<CategoryEntity> category;


  ProductEntity({
    required this.id,
    required this.name,
    this.brand,
    required this.imageUrl,
    required this.marks,
    required this.price,
    required this.stock,
    required this.discount,
    required this.description,
    required this.specification,
    required this.category
});
}