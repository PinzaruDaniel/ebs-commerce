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

  Future<Either<Failure, List<ProductEntity>>> getSaleProducts(int page, int perPage);

  Future<Either<Failure, List<ProductEntity>>> getNewProducts(int page, int perPage);

  Future<Either<Failure, List<ProductEntity>>> getProducts(int page, int perPage);
}
