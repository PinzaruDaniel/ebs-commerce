import 'package:domain/modules/products/models/product_entity.dart';
import 'package:domain/modules/products/products_repository.dart';

class GetAllProductsUseCase {
  final ProductsRepository productsRepository;

  GetAllProductsUseCase({required this.productsRepository});

  Future<List<ProductEntity>> getAll()async {
    return productsRepository.getAllProduct();
  }
}


