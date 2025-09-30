import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>,GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Future<Either<Failure, List<ProductEntity>>> call(params) async {
//TODO: initialize Stream, use controller to set from cache and from api(to set)

   var either = await  productsRepository.getProducts( params.page, params.perPage, params.marks);
  return  either.fold(
       (failure) async{
         return Left(failure);
       },
       (newItems) async{
         print('new item specs ${newItems[0].specification!.length}');
         await productsRepository.setProductsLocalCache(newItems);
         return Right(newItems);
       }
   );
  }
}

class GetProductsParams {

  final int page;
  final int perPage;
  final String? marks;
  GetProductsParams({required this.page, required this.perPage, this.marks});
}
