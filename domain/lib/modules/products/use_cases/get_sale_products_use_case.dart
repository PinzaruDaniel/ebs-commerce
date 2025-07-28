import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/products/products_repository.dart';

import '../models/index.dart';


class GetSaleProductsUseCase{
  final ProductsRepository productsRepository;
  GetSaleProductsUseCase({required this.productsRepository});

  Future<Either<Failure,List<ProductEntity>>> getSale()async {
    return productsRepository.getSaleProduct();
  }

}