import 'package:data/modules/products/models/local/product_box.dart';
import 'package:objectbox/objectbox.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts(List<ProductBox> productsBox);

  Future<List<ProductBox>> getProducts();
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  ProductsLocalDataSourceImpl({required this.productBox});

  Box<ProductBox> productBox;

  @override
  Future<void> setProducts(productsBox) async {
    await productBox.putManyAsync(productsBox);
  }

  @override
  Future<List<ProductBox>> getProducts() async {
    final products = productBox.getAll();
    return products;
  }
}
