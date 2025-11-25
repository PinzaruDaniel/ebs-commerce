import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

import 'models/index.dart';

abstract class ProductsRepository {
  Future<Either<Failure, ProductResponseEntity>> getFilteredProducts(
    int page,
    double priceGte,
    double priceLte,
    List<int>? categoriesId,
  );

  Future<Either<Failure, int>> getFilteredProductsCount(
    int page,
    double priceGte,
    double priceLte,
    List<int>? categoriesId,
  );

  Future<Either<Failure, List<ProductEntity>>> getProducts(int page, int perPage, String? marks);

  Future<void> setProductsLocalCache(List<ProductEntity> products);

  Future<Either<Failure, List<ProductEntity>>> getSaleProducts(int page, int perPage);
  Future<Either<Failure, List<ProductEntity>>> getNewProducts(int page, int perPage);

  Stream<List<ProductEntity>> getProductsLocalCache();

  Stream<List<OrderEntity>> getOrdersLocalCache(int idUser);
  Future<void> setOrderedLocalCache(List<OrderEntity> orders, int idUser);

}
