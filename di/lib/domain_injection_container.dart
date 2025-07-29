import 'package:di/domain/products_injection_container.dart' as products;
import'package:di/domain/categories_injection_container.dart' as categories;


Future<void> initDomain() async{
  products.init();
  categories.init();
}
