import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/products_repository.dart';

class ClearProductsUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  final ProductsRepository productsRepository;

  ClearProductsUseCase({required this.productsRepository});

  @override
  Future<void> call() async {
    productsRepository.clearAllProducts();
  }
}
