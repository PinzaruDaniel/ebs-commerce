import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/models/product_entity.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';


class GetAllProductsUseCase {
  final ProductsRepository productsRepository;

  GetAllProductsUseCase({required this.productsRepository});

  Future<Either<Failure,List<ProductEntity>>> getAll()async {
    try{
      final  response = await productsRepository.getAllProduct();
      return Right(response);
    }
    catch (e){
      return Left(ServerFailure('Unable to load products'));
    }
  }
}


