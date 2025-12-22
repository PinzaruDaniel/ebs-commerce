import 'package:domain/core/usecase.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class GetProductsByMarksUseCase extends UseCaseStream<List<ProductEntity>, GetProductsByMarksParams> {
  final ProductsRepository productsRepository;

  GetProductsByMarksUseCase({required this.productsRepository});

  @override
  Stream<List<ProductEntity>> call(GetProductsByMarksParams params) {
    return productsRepository.getProductsByMarks(params.marks);
  }
}

class GetProductsByMarksParams {
  final String marks;

  GetProductsByMarksParams({required this.marks});
}
