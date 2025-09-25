
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';

import '../products_repository.dart';

class GetProductsLocalUseCase extends UseCaseNoEitherNoParams<List<ProductEntity>>{
  final ProductsRepository productsRepository;
  GetProductsLocalUseCase({required this.productsRepository});
  @override
  Future<List<ProductEntity>> call() {
    return productsRepository.getProductsLocalCache();
  }
}