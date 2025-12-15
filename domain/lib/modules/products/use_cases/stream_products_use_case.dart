import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';
import 'dart:async';

class StreamProductsUseCase extends UseCaseStream<List<ProductEntity>, StreamProductsParams> {
  final ProductsRepository productsRepository;

  StreamProductsUseCase({required this.productsRepository});

  Stream<List<ProductEntity>> call(params) async* {
    var streamController = StreamController<List<ProductEntity>>();

    productsRepository.getProductsLocalCache(params.page).distinct().listen((event) {
      streamController.sink.add(event);
    });
    yield* streamController.stream;
  }
}

class StreamProductsParams {
  final int page;
  final int perPage;
  final String? marks;

  StreamProductsParams({required this.page, required this.perPage, this.marks});
}
