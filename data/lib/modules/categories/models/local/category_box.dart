import 'package:data/objectbox.g.dart';

import '../../../products/models/local/product_box.dart';

@Entity()
class CategoryBox {
  @Id(assignable: true)
  int idCategory;
  String name;
  int level;
  int? parent;
  final product = ToOne<ProductBox>();


  CategoryBox({this.idCategory = 0, required this.name, required this.level, required this.parent});
}
