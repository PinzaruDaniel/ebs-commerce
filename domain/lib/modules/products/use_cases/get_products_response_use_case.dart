import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class GetProductsResponseUseCase extends UseCaseNoEither<ProductResponseEntity?, GetProductsResponseParams> {
  final ProductsRepository productsRepository;

  GetProductsResponseUseCase({required this.productsRepository});

  Future<ProductResponseEntity?> call(params) {
    return productsRepository.getProductsResponseFromCache(params.currentPage);
  }
}

class GetProductsResponseParams {
  int currentPage;

  GetProductsResponseParams({required this.currentPage});
}
