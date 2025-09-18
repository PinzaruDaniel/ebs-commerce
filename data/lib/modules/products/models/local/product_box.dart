import 'package:objectbox/objectbox.dart';

@Entity()
class ProductBox {
  @Id(assignable: true)
  int id;

  String name;

  String? price;
  String? discount;
  String? discountedPrice;

  String? imageUrl;
  String? marks;

  int? stock;
  String? description;

  ProductBox({
    this.id = 0,
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
