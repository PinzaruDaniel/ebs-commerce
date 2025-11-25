import 'package:objectbox/objectbox.dart';


@Entity()
class ProductResponseBox {
  @Id()
  int? idProductResponse;
  String currentPage;

  ProductResponseBox({
    this.idProductResponse,
    required this.currentPage,
  });
}
