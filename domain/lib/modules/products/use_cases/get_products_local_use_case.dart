
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';

import '../products_repository.dart';

class GetProductsLocalUseCase extends UseCaseNoEitherNoParams<List<ProductEntity>>{
  final ProductsRepository productsRepository;
  GetProductsLocalUseCase({required this.productsRepository});
  @override
  Stream<List<ProductEntity>> call() {
    return productsRepository.getProductsLocalCache();
  }
}