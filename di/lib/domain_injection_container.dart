import 'package:di/domain/products_injection_container.dart' as products;
import'package:di/domain/categories_injection_container.dart' as categories;
import 'package:di/domain/delivery_addresses_injection_controller.dart' as addresses;


Future<void> initDomain() async{
  products.init();
  categories.init();
  addresses.init();
}
