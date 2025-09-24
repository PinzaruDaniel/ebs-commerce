import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';

class GetFilteredProductsCountUseCase extends UseCase<int, GetFilteredProductsCountParams> {
  final ProductsRepository productsRepository;

  GetFilteredProductsCountUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, int>> call(params) async {
    return productsRepository.getFilteredProductsCount(
      params.page,
      params.priceGte,
      params.priceLte,
      params.categoriesId,
    );
  }
}

class GetFilteredProductsCountParams {
  int page;
  double priceGte;
  double priceLte;
  List<int>? categoriesId;

  GetFilteredProductsCountParams({
    required this.page,
    required this.priceGte,
    required this.priceLte,
    required this.categoriesId,
  });
}
