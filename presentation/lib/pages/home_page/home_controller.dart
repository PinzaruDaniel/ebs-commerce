import 'package:domain/modules/categories/use_cases/get_all_categories_use_case.dart';
import 'package:domain/modules/products/use_cases/get_all_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/widgets/horizontal_products_list_widget.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../view/base_view_model.dart';

class HomeController extends GetxController {

  final GetAllProductsUseCase getAllProductsUseCase = GetIt.instance<GetAllProductsUseCase>();
  final GetSaleProductsUseCase getSaleProductsUseCase = GetIt.instance<GetSaleProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase = GetIt.instance<GetNewProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];


  void getProducts() async {
    isLoading.value = true;
    await getAllProductsUseCase.call().then((either) async {
      either.fold(
        (failure) {
          isLoading.value = false;
        },

        (products) async {
          this.products.value = products.map((e) => e.toModel).toList();
          getNewProducts();
          await getSaleProducts();
          items.value = [
            AdBannerViewModel(),
            HorizontalProductListViewModel(products: newProducts, type: ProductType.newProducts),
            HorizontalProductListViewModel(products: saleProducts, type: ProductType.saleProducts),
            AllProductsViewItem(items: products.map((e) => e.toModel).toList()),
          ];
          isLoading.value = false;
        },
      );
    });
  }

  Future<void> getNewProducts() async {
    await getNewProductsUseCase.call().then((either) async {
      either.fold(
        (failure) {
          isLoading.value = false;
        },

        (products) async {
          newProducts = products.map((e) => e.toModel).toList();
        },
      );
    });
  }

  Future<void> getSaleProducts() async {
    await getSaleProductsUseCase.call().then((either) async {
      either.fold(
        (failure) {
          isLoading.value = false;
        },

        (products) async {
          saleProducts = products.map((e) => e.toModel).toList();
        },
      );
    });
  }
}
