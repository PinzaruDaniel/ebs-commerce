import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class SyncProductsUseCase extends UseCase<List<ProductEntity>, SyncProductsParams> {
  final ProductsRepository productsRepository;

  SyncProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(params) async {
    return productsRepository.getProducts(params.page, params.perPage, params.marks);
  }
}

class SyncProductsParams {
  int page;
  int perPage;
  String? marks;

  SyncProductsParams({required this.page, required this.perPage, this.marks});
}
