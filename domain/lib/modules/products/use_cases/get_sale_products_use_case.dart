import 'package:domain/modules/products/models/product_entity.dart';
import 'package:domain/modules/products/products_repository.dart';


class GetSaleProductsUseCase{
  final ProductsRepository productsRepository;
  GetSaleProductsUseCase({required this.productsRepository});

  Future<List<ProductEntity>> getSale()async {
    return productsRepository.getSaleProduct();
  }

}