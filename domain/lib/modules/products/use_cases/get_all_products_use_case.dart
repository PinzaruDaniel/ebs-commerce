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
    try{
      final result=await productsRepository.getAllProduct();
      return Right(result);
    }
    catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      } else if (e is Exception) {
        return Left(Failure.exception(e, stackTrace));
      } else {
        return Left(Failure.error(e, stackTrace));
      }
    }
  }
}

class NoParams {
}


