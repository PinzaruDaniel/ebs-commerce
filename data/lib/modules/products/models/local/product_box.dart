import 'package:data/modules/products/models/local/product_response_box.dart';
import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:objectbox/objectbox.dart';

import '../../../categories/models/local/category_box.dart';

@Entity()
class ProductBox {
  @Id()
  int id;
  int idProduct;
  String name;
  String? price;
  String? discount;
  String? discountedPrice;
  String? imageUrl;
  String? marks;
  int? stock;
  String? description;


  @Backlink('product')
  final categories=ToMany<CategoryBox>();

  @Backlink('product')
  final specifications = ToMany<SpecificationBox>();

  final productsResponse=ToOne<ProductResponseBox>();

  ProductBox( {
    this.id=0,
    required this.idProduct,
    required this.name,
    this.price,
    this.discount,
    this.discountedPrice,
    this.imageUrl,
    this.marks,
    this.stock,
    this.description,
  });
}
