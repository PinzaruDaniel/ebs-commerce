import 'package:common/constants/logger.dart';
import 'package:data/mapper/category_mapper.dart';
import 'package:data/mapper/product_mapper.dart';
import 'package:data/mapper/specification_mapper.dart';
import 'package:data/modules/categories/models/local/category_box.dart';
import 'package:data/modules/products/models/local/ordered_product_box.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:objectbox/objectbox.dart';

import '../../models/local/order_box.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts({required List<ProductEntity> products});

  Future<void> setOrders({required List<OrderEntity> orders});

  Stream<List<ProductBox>> getProducts();

  Stream<List<OrderBox>> getOrders();
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  ProductsLocalDataSourceImpl({
    required this.productBox,
    required this.specBox,
    required this.categoryBox,
    required this.orderBox,
    required this.orderedProductBox,
  });

  Box<ProductBox> productBox;
  Box<SpecificationBox> specBox;
  Box<CategoryBox> categoryBox;
  Box<OrderBox> orderBox;
  Box<OrderedProductBox> orderedProductBox;

  @override
  Future<void> setProducts({required List<ProductEntity> products}) async {
    await productBox.putManyAsync(
      products.map((e) {
        return e.toBox;
      }).toList(),
    );
  }

  @override
  Future<void> setOrders({required List<OrderEntity> orders}) async {
    for (final orderEntity in orders) {
      consoleLog('Setting order ${orderEntity.id} with ${orderEntity.products.length} products');

      final existingOrder = orderBox.get(orderEntity.id);
      if (existingOrder != null) {
        final existingProductIds = existingOrder.products.map((p) => p.idProduct).toSet();
        final newProductIds = orderEntity.products.map((p) => p.idProduct).toSet();

        final sameProducts =
            existingProductIds.length == newProductIds.length && existingProductIds.containsAll(newProductIds);
        if (sameProducts) {
          consoleLog('Order ${orderEntity.id} already exists with same products. Skipping.');
          continue;
        }
        consoleLog('Order ${orderEntity.id} exists but has changed products. Updating...');
      }
      final orderedProductBoxes = orderEntity.products.map((p) => p.toBox).toList();
      for (final productBox in orderedProductBoxes) {
        final savedId = orderedProductBox.put(productBox);
        consoleLog('Saved OrderedProductBox with id: $savedId, idProduct: ${productBox.idProduct}');
      }
      final newOrderBox = OrderBox(id: orderEntity.id, dateTime: orderEntity.dateTime);
      newOrderBox.products.addAll(orderedProductBoxes);

      await orderBox.putAsync(newOrderBox);
    }
  }

  @override
  Stream<List<OrderBox>> getOrders() {
    return orderBox.query().watch(triggerImmediately: true).map((query) => query.find().reversed.toList());
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
