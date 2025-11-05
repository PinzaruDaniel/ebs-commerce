import 'package:di/domain/auth_injection_container.dart' as auth;
import 'package:di/domain/products_injection_container.dart' as products;
import 'package:di/domain/categories_injection_container.dart' as categories;
import 'package:di/domain/delivery_addresses_injection_container.dart' as addresses;
import 'package:di/domain/user_information_injection_container.dart' as user;

Future<void> initDomain() async {
  auth.init();
  products.init();
  categories.init();
  addresses.init();
  user.init();
}
