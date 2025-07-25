import 'package:domain/modules/products/models/product_entity.dart';
import 'package:domain/modules/products/products_repository.dart';


class GetNewProductsUseCase{
  final ProductsRepository productsRepository;
  GetNewProductsUseCase({required this.productsRepository});

  Future<List<ProductEntity>> getNew()async {
    return productsRepository.getNewProduct();
  }

}