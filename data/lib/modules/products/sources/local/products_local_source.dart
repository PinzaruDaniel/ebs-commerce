import 'package:common/constants/logger.dart';
import 'package:data/mapper/product_mapper.dart';
import 'package:data/modules/products/models/local/ordered_product_box.dart';
import 'package:data/modules/products/models/local/product_box.dart';
import 'package:data/modules/products/models/local/product_response_box.dart';
import 'package:data/modules/specifications/models/local/specification_box.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:objectbox/objectbox.dart';
import 'package:collection/collection.dart';
import '../../../../mapper/category_mapper.dart';
import '../../../../mapper/product_response_mapper.dart';
import '../../../../mapper/specification_mapper.dart';
import '../../../../objectbox.g.dart';
import '../../../categories/models/local/category_box.dart';
import '../../models/local/order_box.dart';

abstract class ProductsLocalDataSource {
  Future<void> setProducts({required ProductResponseEntity products});

  Future<void> setOrders({required List<OrderEntity> orders, required int idUser});

  Stream<List<ProductBox>> getProducts({required int currentPage});

  Stream<List<OrderBox>> getOrders(int idUser);

  Future<List<ProductResponseBox>?> getProductsResponseFromCache({required int currentPage});
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

  @override
  Future<void> setProducts({required ProductResponseEntity products}) async {
    var allProductsResponse = await productResponseBox.getAllAsync();
    if (allProductsResponse.any((p) => p.pageId == products.currentPage)) {
      return;
    } else {
      var productsB = products.response.map((e) => e.toBox).toList();
      await productBox.putManyAsync(productsB);
      final productResponseBoxMapped = products.toBox;
      consoleLog('productResponseBox pageId: ${productResponseBoxMapped.pageId}');
      consoleLog('productsResponseBox id: ${productResponseBoxMapped.idProductResponse} ');
      productResponseBoxMapped.products.addAll(productsB);
      await productResponseBox.putAsync(productResponseBoxMapped);
      var res = await productResponseBox.getAllAsync();
      consoleLog(
        'currentPage is first where ${products.currentPage} | ${res.firstWhereOrNull((e) => e.pageId == products.currentPage)?.products.length} ',
      );
    }
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
    for (final product in products) {
      specBox.putManyAsync(product.specification?.map((e) => e.toBox).toList() ?? []);
      categoryBox.putManyAsync(product.category?.map((e) => e.toBox).toList() ?? []);
    }
    await productBox.putManyAsync(products.map((e) => e.toBox).toList());
  }

  @override
  Stream<List<ProductBox>> getProducts({required int currentPage}) async* {
    consoleLog('current page in getProducts: $currentPage');
    final productsFromCache = productResponseBox
        .query(ProductResponseBox_.pageId.equals(currentPage))
        .watch(triggerImmediately: true)
        .map((query) {
          final responseBoxList = query.find();
          return responseBoxList.expand((e) => e.products).toList();
        });

    yield* productsFromCache;
  }

  @override
  Future<List<ProductResponseBox>?> getProductsResponseFromCache({required int currentPage}) async {
    var response = await productResponseBox.getAllAsync();
    return response;
  }

  /*  @override
  Stream<List<ProductBox>> getProducts({required int currentPage}) async* {
    yield* productResponseBox.query().watch(triggerImmediately: true).map((query) {
      final allPages = productResponseBox.getAll();
      return allPages.expand((page) => page.products).toList();
    });
  }*/
}
