import 'package:domain/modules/products/models/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getAllProduct();

  Future<List<ProductEntity>> getSaleProduct();

  Future<List<ProductEntity>> getNewProduct();


}
