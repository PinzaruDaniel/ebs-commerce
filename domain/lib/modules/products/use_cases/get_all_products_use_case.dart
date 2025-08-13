import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';

class GetFilteredProductsUseCase extends UseCase<List<ProductEntity>, GetFilteredProductsParams> {
  final ProductsRepository productsRepository;

  GetFilteredProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(params) async {
    return productsRepository.getFilteredProducts(params.priceGte, params.priceLte);
  }
}

class GetFilteredProductsParams {
  double priceGte;
  double priceLte;

  GetFilteredProductsParams({required this.priceGte, required this.priceLte});
}
