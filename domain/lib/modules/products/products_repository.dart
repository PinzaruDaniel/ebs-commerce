import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

import 'models/index.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, List<ProductEntity>>> getSaleProducts();

  Future<Either<Failure, List<ProductEntity>>> getNewProducts();
  Future<Either<Failure, List<ProductEntity>>> getProducts();

}
