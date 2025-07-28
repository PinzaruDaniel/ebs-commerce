import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/products/products_repository.dart';

import '../models/index.dart';


class GetNewProductsUseCase{
  final ProductsRepository productsRepository;
  GetNewProductsUseCase({required this.productsRepository});

  Future<Either<Failure,List<ProductEntity>>> getNew()async {
    return productsRepository.getNewProducts();
  }

}