import 'package:objectbox/objectbox.dart';
import '../../../products/models/local/product_box.dart';

@Entity()
class SpecificationBox {
  @Id(assignable: true)
  int idSpec;
  int attributeId;
  String attributeName;
  String value;

  final product = ToOne<ProductBox>();

  SpecificationBox({
    required this.idSpec,
    required this.attributeId,
    required this.attributeName,
    required this.value,
  });
}
