import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';

import '../products_repository.dart';

class SetProductLocalUseCase extends UseCaseNoEither<void, List<ProductEntity>> {
  final ProductsRepository productsRepository;

  SetProductLocalUseCase({required this.productsRepository});

  Future<void> call(List<ProductEntity> products) async {
    return productsRepository.setProductsLocalCache(products);
  }
}
