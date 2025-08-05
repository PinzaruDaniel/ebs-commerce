import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/products_repository.dart';

import '../models/index.dart';

class GetNewProductsUseCase extends UseCaseNoParams<List<ProductEntity>> {
  final ProductsRepository productsRepository;

  GetNewProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return productsRepository.getNewProducts();
  }
}
