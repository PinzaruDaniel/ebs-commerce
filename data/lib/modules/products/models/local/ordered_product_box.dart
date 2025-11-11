import 'package:objectbox/objectbox.dart';

@Entity()
class OrderedProductBox{
  @Id(assignable: true)
  int idProduct;
  String title;
  String? imageUrl;
  String? price;
  int quantity;
  OrderedProductBox({
    this.idProduct=0,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
});
}