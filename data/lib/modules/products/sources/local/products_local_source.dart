import 'package:common/constants/logger.dart';
import 'package:data/mapper/product_mapper.dart';
import 'package:data/modules/products/models/local/ordered_product_box.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/products/models/local/product_response_box.dart';
import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../mapper/product_response_mapper.dart';
import '../../../../objectbox.g.dart';
import '../../../categories/models/local/category_box.dart';
import '../../models/local/order_box.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts({required ProductResponseEntity products});

  Future<void> setOrders({required List<OrderEntity> orders, required int idUser});

  Stream<List<ProductBox>> getProducts({required int currentPage});

  Stream<List<OrderBox>> getOrders(int idUser);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  ProductsLocalDataSourceImpl({
    required this.productBox,
    required this.productResponseBox,
    required this.specBox,
    required this.categoryBox,
    required this.orderBox,
    required this.orderedProductBox,
  });

  Box<ProductBox> productBox;
  Box<ProductResponseBox> productResponseBox;
  Box<SpecificationBox> specBox;
  Box<CategoryBox> categoryBox;
  Box<OrderBox> orderBox;
  Box<OrderedProductBox> orderedProductBox;

  /*  @override
  Future<void> setProducts({required List<ProductEntity> products}) async {
    consoleLog('products length setProducts: ${products.length}');

    final existingProducts = productBox.getAll();
    final Set<int> seenProductsId = existingProducts.map((p) => p.idProduct).toSet();

    final List<ProductEntity> finalProducts = [];

    for (var p in products) {
      if (p.id != 0 && seenProductsId.contains(p.id)) {
        consoleLog('Duplicated product detected: ${p.name} with id ${p.id}, set to 0');
        finalProducts.add(p.copyWith(id: 0));
      } else {
        seenProductsId.add(p.id);
        finalProducts.add(p);
      }
    }


    await productBox.putManyAsync(finalProducts.map((e) {
      consoleLog('product id: ${e.id} ${e.name}');
      return e.toBox;
    }).toList());

    var allProducts = productBox.getAll();
    consoleLog('products getAll length: ${allProducts.length}');
  }*/

  @override
  Future<void> setProducts({required ProductResponseEntity products}) async {
    final productResponseBoxMapped = products.toBox;
    consoleLog('productResponseBox pageId: ${productResponseBoxMapped.pageId}');
    consoleLog('productsResponseBox id: ${productResponseBoxMapped.idProductResponse} ');
    consoleLog('productbox id: ${productResponseBoxMapped.products[0].idProduct}');
    await productResponseBox.putAsync(productResponseBoxMapped, mode: PutMode.put);
  }

  @override
  Future<void> setOrders({required List<OrderEntity> orders, required int idUser}) async {
    for (final orderEntity in orders) {
      final existingOrder = orderBox.get(orderEntity.idOrder);
      if (existingOrder != null) {
        final existingProductIds = existingOrder.products.map((p) => p.idProduct).toSet();
        final newProductIds = orderEntity.products.map((p) => p.idProduct).toSet();

        final sameProducts =
            existingProductIds.length == newProductIds.length && existingProductIds.containsAll(newProductIds);
        if (sameProducts) {
          continue;
        }
      }
      final orderedProductBoxes = orderEntity.products.map((p) => p.toBox).toList();
      for (final productBox in orderedProductBoxes) {
        orderedProductBox.put(productBox);
      }
      final newOrderBox = OrderBox(idOrder: orderEntity.idOrder, dateTime: orderEntity.dateTime, idUser: idUser);
      newOrderBox.products.addAll(orderedProductBoxes);

      await orderBox.putAsync(newOrderBox);
    }
  }

  @override
  Stream<List<OrderBox>> getOrders(int idUser) {
    return orderBox.query(OrderBox_.idUser.equals(idUser)).watch(triggerImmediately: true).asyncMap((query) async {
      final orders = query.find();

      final now = DateTime.now();
      final threshold = now.subtract(Duration(days: 7));

      final outdated = orders.where((o) => o.dateTime.isBefore(threshold)).toList();

      for (final o in outdated) {
        await orderBox.removeAsync(o.idOrder);
      }

      return orders.where((o) => !outdated.contains(o)).toList().reversed.toList();
    });
  }

  Future<void> setProductsSpecs({required List<ProductEntity> products}) async {
    /*
    for (final product in products) {
      specBox.putManyAsync(product.specification?.map((e) => e.toBox).toList() ?? []);
      categoryBox.putManyAsync(product.category?.map((e) => e.toBox).toList() ?? []);
    }
    await productBox.putManyAsync(products.map((e) => e.toBox).toList());*/
  }

  @override
  Stream<List<ProductBox>> getProducts({required int currentPage}) {
    consoleLog('current page in getProducts: $currentPage');
    var productsLength = productResponseBox.getAll();
    consoleLog('current nr of products in getProducts: ${productsLength.length}');

    var products = productResponseBox.get(currentPage);
    for (var p in products!.products) {
      consoleLog('product id and name: ${p.idProduct} ${p.name}');
    }
    consoleLog('product length: ${products.products.length}');

    var productsFromCache = productResponseBox
        .query(ProductResponseBox_.pageId.equals(currentPage))
        .watch(triggerImmediately: true)
        .map((query) {
          final responseBoxList = query.find();
          final productList = responseBoxList.expand((response) => response.products).toList();
          final productsMapped=productsLength.expand((e)=>e.products).toList();
          productsMapped.addAll(productList);
          consoleLog('productsMapped Length: ${productsMapped.length}');
          consoleLog('productsList Length: ${productList.length}');
          return productsMapped;
        });
    return productsFromCache;
  }
}
