import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';


class GetAllProductsUseCase extends UseCase<List<ProductEntity>>{
  final ProductsRepository productsRepository;

  GetAllProductsUseCase({required this.productsRepository});
  
  @override
  Future<Either<Failure,List<ProductEntity>>> call()async {
    return productsRepository.getAllProduct();
  }
}


