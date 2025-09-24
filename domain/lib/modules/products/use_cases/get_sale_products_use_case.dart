/*
import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/products_repository.dart';

import '../models/index.dart';


class GetSaleProductsUseCase extends UseCase<List<ProductEntity>, GetSaleProductsParams>{
  final ProductsRepository productsRepository;
  GetSaleProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(params)async {
    return productsRepository.getSaleProducts(params.page, params.perPage);
  }

}

class  GetSaleProductsParams{
  int page;
  int perPage;
  GetSaleProductsParams({required this.page, required this.perPage});
}*/
