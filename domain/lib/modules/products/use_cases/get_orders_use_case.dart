import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class GetOrdersUseCase extends UseCaseStream<List<OrderEntity>, GetOrdersParams> {
  final ProductsRepository productsRepository;

  GetOrdersUseCase({required this.productsRepository});

  @override
  Stream<List<OrderEntity>> call(params) {
    return productsRepository.getOrdersLocalCache(params.idUser).distinct();
  }
}

class GetOrdersParams {
  final int idUser;
  GetOrdersParams({required this.idUser});
}
