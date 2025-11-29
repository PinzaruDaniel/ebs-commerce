import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';

import '../products_repository.dart';

class SetOrdersUseCase extends UseCaseNoEither<void, SetOrdersParams> {
  final ProductsRepository productsRepository;

  SetOrdersUseCase({required this.productsRepository});

  @override
  Future<void> call(params) async {
    return productsRepository.setOrderedLocalCache(params.orders, params.idUser);
  }
}

class SetOrdersParams {
  final List<OrderEntity> orders;
  final int idUser;

  SetOrdersParams({required this.orders, required this.idUser});
}