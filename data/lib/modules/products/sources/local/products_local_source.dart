import 'package:data/modules/categories/models/local/category_box.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:objectbox/objectbox.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts(List<ProductBox> productsBox);

  Stream<List<ProductBox>> getProducts();
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  ProductsLocalDataSourceImpl({required this.productBox, required this.specBox, required this.categoryBox});

  Box<ProductBox> productBox;
  Box<SpecificationBox> specBox;
  Box<CategoryBox> categoryBox;

  @override
  Future<void> setProducts(productsBox) async {
    final List<int> specsToRemove = [];
    final List<int> categoriesToRemove = [];
    for (final newProduct in productsBox) {
      final existing = productBox.get(newProduct.idProduct);

      if (existing != null) {
        specsToRemove.addAll(existing.specifications.map((e) => e.idSpec));
        existing.specifications.clear();
        categoriesToRemove.addAll(existing.categories.map((e) => e.idCategory));
        existing.categories.clear();
        await productBox.putAsync(existing);
      }
    }
    await productBox.putManyAsync(productsBox);

    if (specsToRemove.isNotEmpty) {
      specBox.removeMany(specsToRemove);
    }
    if (categoriesToRemove.isNotEmpty) {
      categoryBox.removeMany(categoriesToRemove);
    }
  }

  @override
  Stream<List<ProductBox>> getProducts()  {
    return productBox.query().watch(triggerImmediately: true).map((query) => query.find().reversed.toList());
  }
}
