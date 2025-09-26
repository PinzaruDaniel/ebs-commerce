import 'package:objectbox/objectbox.dart';
import '../../../products/models/local/product_box.dart';

@Entity()
class SpecificationBox {
  @Id(assignable: true)
  int idSpec;
  String attributeName;

  String value;

  final product = ToOne<ProductBox>();

  SpecificationBox({
    this.idSpec = 0,
    required this.attributeName,
    required this.value,
  });
}
