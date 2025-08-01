import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>>{
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure,List<ProductEntity>>> call()async {
    return productsRepository.getProducts();
  }
}