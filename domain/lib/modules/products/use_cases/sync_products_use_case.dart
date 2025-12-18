import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/products_repository.dart';

class SyncProductsUseCase extends UseCase<void, SyncProductsParams> {
  final ProductsRepository productsRepository;

  SyncProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, void>> call(params) async {
    return await productsRepository.getProducts(params.page, params.perPage, params.marks).then((either) {
      return either.fold(
        (failure) {
          return Left(failure);
        },
        (productsApi) {
          productsRepository.setProductsLocalCache(productsApi);
          return Right(null);
          //return Right(productsRepository.setProductsLocalCache(productsApi));
        },
      );
    });
  }
}

class SyncProductsParams {
  int page;
  int perPage;
  String? marks;

  SyncProductsParams({required this.page, required this.perPage, this.marks});
}
