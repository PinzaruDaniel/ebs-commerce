import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';

class GetFilteredProductsUseCase extends UseCase<ProductResponseEntity, GetFilteredProductsParams> {
  final ProductsRepository productsRepository;

  GetFilteredProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, ProductResponseEntity>> call(params) async {
    return productsRepository.getFilteredProducts(
      params.page,
      params.priceGte,
      params.priceLte,
      params.categoriesId,
    );
  }
}


  class GetFilteredProductsParams {
    int page;
    double priceGte;
    double priceLte;
    List<int>? categoriesId;
    GetFilteredProductsParams({required this.page, required this.priceGte, required this.priceLte, required this.categoriesId});
  }
