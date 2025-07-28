import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/index.dart';


class GetAllProductsUseCase {
  final ProductsRepository productsRepository;

  GetAllProductsUseCase({required this.productsRepository});

  Future<Either<Failure,List<ProductEntity>>> getAll()async {
    return productsRepository.getAllProduct();
  }
}


