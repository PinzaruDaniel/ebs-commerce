import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/products_repository.dart';

import '../models/index.dart';


class GetSaleProductsUseCase extends UseCaseNoParams<List<ProductEntity>>{
  final ProductsRepository productsRepository;
  GetSaleProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call()async {
    return productsRepository.getSaleProducts();
  }

}