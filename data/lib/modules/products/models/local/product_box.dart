import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:objectbox/objectbox.dart';

import '../../../categories/models/local/category_box.dart';

@Entity()
class ProductBox {
  @Id(assignable: true)
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
  final categories = ToMany<CategoryBox>();

  @Backlink('product')
  final specifications=ToMany<SpecificationBox>();

  ProductBox({
    this.idProduct = 0,
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
