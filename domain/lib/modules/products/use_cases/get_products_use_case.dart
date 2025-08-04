import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Future<Either<Failure, List<ProductEntity>>> call({required int page , required int perPage}) async {
    return productsRepository.getProducts(page: page, perPage: perPage);
  }
}
