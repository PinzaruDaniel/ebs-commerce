import 'package:objectbox/objectbox.dart';

import 'ordered_product_box.dart';

@Entity()
class OrderBox {
  @Id(assignable: true)
  int id;
  DateTime dateTime;

  final ToMany<OrderedProductBox> products;

  OrderBox({this.id = 0, required this.dateTime}) : products = ToMany<OrderedProductBox>();
}
