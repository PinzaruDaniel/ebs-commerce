import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class SetProductsCachedUseCase extends UseCaseNoEither<void, List<ProductEntity>> {
  final ProductsRepository productsRepository;
  SetProductsCachedUseCase({required this.productsRepository});

  Future<void> call(List<ProductEntity> products)async{
    print('caching ${products.length}');
    return productsRepository.setProductsLocalCache(products);
  }
}
