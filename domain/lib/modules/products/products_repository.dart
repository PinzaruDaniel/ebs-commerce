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

  Future<List<ProductEntity>>getProductsLocalCache();
}
