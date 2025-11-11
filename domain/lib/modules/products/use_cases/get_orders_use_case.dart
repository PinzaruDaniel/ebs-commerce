import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class GetOrdersUseCase extends UseCaseNoEitherNoParams<List<OrderEntity>> {
  final ProductsRepository productsRepository;

  GetOrdersUseCase({required this.productsRepository});

  @override
  Stream<List<OrderEntity>> call() {
    return productsRepository.getOrdersLocalCache().distinct();
  }
}
