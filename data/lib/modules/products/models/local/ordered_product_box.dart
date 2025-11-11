import 'package:objectbox/objectbox.dart';

import 'order_box.dart';

@Entity()
class OrderedProductBox{
  @Id()
  int id = 0;
  
  int idProduct;
  String title;
  String? imageUrl;
  String? price;
  int quantity;
  final order=ToMany<OrderBox>();
  OrderedProductBox({
    this.id = 0,
    this.idProduct=0,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
});
}