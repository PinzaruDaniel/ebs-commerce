import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

import 'models/index.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();

  Future<Either<Failure, List<ProductEntity>>> getSaleProduct();

  Future<Either<Failure, List<ProductEntity>>> getNewProducts();
}
