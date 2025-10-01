import 'package:data/mapper/category_mapper.dart';
import 'package:data/mapper/product_mapper.dart';
import 'package:data/mapper/specification_mapper.dart';
import 'package:data/modules/categories/models/local/category_box.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:objectbox/objectbox.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts({required List<ProductEntity> products});

  Stream<List<ProductBox>> getProducts();
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  ProductsLocalDataSourceImpl({required this.productBox, required this.specBox, required this.categoryBox});

  Box<ProductBox> productBox;
  Box<SpecificationBox> specBox;
  Box<CategoryBox> categoryBox;

  @override
  Future<void> setProducts({required List<ProductEntity> products}) async {
    await productBox.putManyAsync(
      products.map((e) {
        return e.toBox;
      }).toList(),
    );
  }

  Future<void> setProductsSpecs({required List<ProductEntity> products}) async {
    for (final product in products) {
      specBox.putManyAsync(product.specification?.map((e) => e.toBox).toList() ?? []);
      categoryBox.putManyAsync(product.category?.map((e) => e.toBox).toList() ?? []);
    }
    await productBox.putManyAsync(products.map((e) => e.toBox).toList());
  }

  @override
  Stream<List<ProductBox>> getProducts() {
    return productBox.query().watch(triggerImmediately: true).map((query) => query.find().reversed.toList());
  }
}
