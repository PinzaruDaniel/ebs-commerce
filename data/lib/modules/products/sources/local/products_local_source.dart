import 'package:data/modules/products/models/local/product_box.dart';
import 'package:objectbox/objectbox.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts(List<ProductBox> productsBox);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  ProductsLocalDataSourceImpl({required this.productBox});

  Box<ProductBox> productBox;

  @override
  Future<void> setProducts(productsBox ) async {
     productBox.putManyAsync(productsBox);

  }
}
