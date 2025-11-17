import 'package:objectbox/objectbox.dart';

import 'ordered_product_box.dart';

@Entity()
class OrderBox {
  @Id(assignable: true)
  int idOrder;
  int idUser;
  DateTime dateTime;

  @Backlink('order')
  final ToMany<OrderedProductBox> products;

  OrderBox({this.idOrder = 0, required this.dateTime, required this.idUser}) : products = ToMany<OrderedProductBox>();
}
