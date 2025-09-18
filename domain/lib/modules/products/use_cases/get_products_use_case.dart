import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>,GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Future<Either<Failure, List<ProductEntity>>> call(params) async {

    return productsRepository.getProducts( params.page, params.perPage, params.marks);
  }
}

class GetProductsParams {

  final int page;
  final int perPage;
  final String? marks;
  GetProductsParams({required this.page, required this.perPage, this.marks});
}
