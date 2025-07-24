import 'package:domain/modules/products/use_cases/get_all_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/home_page/widgets/home_all_products_list_widget.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/widgets/horizontal_products_list_widget.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../view/base_view_model.dart';


class HomeController extends GetxController {
  final GetAllProductsUseCase getAllProductsUseCase= GetIt.instance<GetAllProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading=true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];

  void getProducts() async {
    isLoading.value=true;
      await getAllProductsUseCase.getAll().then((products) {
        this.products.value = products.map((e) => e.toModel).toList();
        getNewProducts();
        getSaleProducts();
        items.value=[
          AdBannerViewModel(),
          HorizontalProductListViewModel(products: newProducts, type: ProductType.newProducts),
          HorizontalProductListViewModel(products: saleProducts, type: ProductType.saleProducts),
          AllProductsViewItem(items: products.map((e)=>e.toModel).toList()),
        ];
        isLoading.value=false;
      });

  }

  void getNewProducts() {
    newProducts = products.where((product) => product.marks?.contains('new') ?? false).toList();
  }

  void getSaleProducts() {
    saleProducts = products.where((product) => product.marks?.contains('sale') ?? false).toList();
    }
}
