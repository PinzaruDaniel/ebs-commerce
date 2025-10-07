import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';
import 'dart:async';

class GetProductsUseCase extends UseCaseStream<List<ProductEntity>, GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Stream<List<ProductEntity>> call(params) {
    final streamController = StreamController<List<ProductEntity>>();
    productsRepository.getProductsLocalCache().distinct().listen((event) => streamController.sink.add(event));

    productsRepository.getProducts(params.page, params.perPage, params.marks).then((data) {
      data.fold((failure) {}, (productsApi) async {
        await productsRepository.setProductsLocalCache(productsApi);
        streamController.sink.add(productsApi);
      });
    });
    return streamController.stream;
  }
}

class GetProductsParams {
  final int page;
  final int perPage;
  final String? marks;

  GetProductsParams({required this.page, required this.perPage, this.marks});
}
