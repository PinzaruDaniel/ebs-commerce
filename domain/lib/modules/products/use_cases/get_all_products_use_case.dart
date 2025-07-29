import 'package:common/constants/failure_class.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase.dart';
import '../models/index.dart';


class GetAllProductsUseCase extends UseCase<List<ProductEntity>, NoParams>{
  final ProductsRepository productsRepository;

  GetAllProductsUseCase({required this.productsRepository});
  
  @override
  Future<Either<Failure,List<ProductEntity>>> call(NoParams params)async {
    return productsRepository.getAllProduct();
  }
}
class NoParams {
}


