import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/util/widgets/horizontal_products_list_widget.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  final GetSaleProductsUseCase getSaleProductsUseCase = GetIt.instance<GetSaleProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase = GetIt.instance<GetNewProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  RxInt perPage = 20.obs;
  int totalProducts = 1000;
  RxBool isLoadingMore = false.obs;
  RxBool hasMore = true.obs;

  void initItems() {
    items.add(AdBannerViewModel());
    getProducts();
  }

  Future<void> getProducts({bool loadMore = false}) async {
    if (loadMore) {
      if (!hasMore.value || isLoadingMore.value) return;
      isLoadingMore.value = true;
      currentPage.value++;
      perPage.value+=20;
    } else {
      isLoading.value = true;
      products.clear();
      currentPage.value = 1;
      perPage.value=20;
      hasMore.value = true;
    }

    print('[DEBUG] Calling getProductsUseCase with page: ${currentPage.value}, perPage: ${perPage.value}');

    final either = await getProductsUseCase.call(GetProductsParams(page: currentPage.value, perPage: perPage.value));

    either.fold(
      (failure) {
        isLoading.value = false;
        isLoadingMore.value = false;
        showFailureSnackBar(failure);
      },
      (list) async {
        final newItems = list.map((e) => e.toModel).toList();

        if (loadMore) {
          products.addAll(newItems);

          if (newItems.length < perPage.value) {
            hasMore.value = false;
          }
        } else {
          products.assignAll(newItems);
        }
        await getNewProducts();
        await getSaleProducts();

        items.value = [
          AdBannerViewModel(),
          HorizontalProductListViewModel(products: newProducts, type: ProductType.newProducts),
          HorizontalProductListViewModel(products: saleProducts, type: ProductType.saleProducts),
          AllProductsViewItem(items: products.toList()),
        ];

        isLoading.value = false;
        isLoadingMore.value = false;
      },
    );
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

  Future<void> getSaleProducts({bool loadMore = false}) async {
    await getSaleProductsUseCase.call().then((either) async {
      either.fold(
        (failure) {
          isLoading.value = false;
          isLoadingMore.value = false;
        },

        (products) async {
          saleProducts = products.map((e) => e.toModel).toList();
        },
      );
    });
  }
}
