import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/products_repository.dart';

import '../models/index.dart';

class GetNewProductsUseCase extends UseCase<List<ProductEntity>, GetNewProductsParams> {
  final ProductsRepository productsRepository;

  GetNewProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(params) async {
    return productsRepository.getNewProducts(params.page, params.perPage);
  }
}

class GetNewProductsParams {
  int page;
  int perPage;

  GetNewProductsParams({required this.page, required this.perPage});
}
