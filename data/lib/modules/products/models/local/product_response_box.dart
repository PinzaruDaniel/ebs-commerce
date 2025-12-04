import 'package:data/modules/products/models/local/product_box.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ProductResponseBox {
  @Id()
  int? idProductResponse;
  int count;
  int totalPages;
  int? perPage;
  int pageId;
  @Backlink('productsResponse')
  ToMany<ProductBox> products = ToMany<ProductBox>();

  ProductResponseBox({this.idProductResponse = 0, required this.pageId, required this.count, required this.totalPages, required this.perPage});
}
