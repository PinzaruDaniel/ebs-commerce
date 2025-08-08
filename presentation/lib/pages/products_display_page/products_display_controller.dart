import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';

class ProductsDisplayController extends GetxController{
  final GetSaleProductsUseCase getSaleProductsUseCase = GetIt.instance<GetSaleProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase = GetIt.instance<GetNewProductsUseCase>();

}