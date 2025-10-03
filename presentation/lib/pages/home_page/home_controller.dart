import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  StreamSubscription? _streamSubscription;

  void initItems() async {
    items.clear();
    items.add(AdBannerViewModel());
    getProducts();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  Future<void> getProducts({bool loadMore = false}) async {
    if (loadMore) {
      currentPage.value++;
    } else {
      isLoading.value = true;
      products.clear();
    }

    getProductsUseCase
        .call(
          GetProductsParams(
            page: currentPage.value,
            perPage: perPage,
            onCallBack: (isError, fromApi) {
              if (isError) {
                print("Error from API");
              } else if (!fromApi) {
                print("Using cached data");
              } else {
                print("Loaded fresh data from API");
              }
            },
          ),
        )
        .listen(
          (list) async {
            final newItems = list.map((e) => e.toModel).toList();
            if (loadMore) {
              products.addAll(newItems);
            } else {
              products.assignAll(newItems);
            }

            if (!loadMore && currentPage.value == 1) {
              await Future.wait([getNewProducts(), getSaleProducts()]);
            }

            if (newProducts.isNotEmpty && saleProducts.isNotEmpty) {
              items.value = [
                AdBannerViewModel(),
                HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
                HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
                AllProductsViewItem(products: products),
              ];
            }
            isLoading.value = false;
          },
          onError: (failure) {
            isLoading.value = false;
            showFailureSnackBar(failure: failure);
          },
        );
  }

  Future<void> getNewProducts() async {
    getProductsUseCase
        .call(
          GetProductsParams(
            page: 1,
            perPage: 5,
            marks: 'new',
            onCallBack: (isError, fromApi) {
              if (isError) {
                print("Failed to load new products");
              }
            },
          ),
        )
        .listen((productsList) {
          newProducts = productsList.map((e) => e.toModel).toList();
          items.refresh();
        }, onError: (failure) {});
  }

  Future<void> getSaleProducts() async {
    getProductsUseCase
        .call(
          GetProductsParams(
            page: 1,
            perPage: 5,
            marks: 'sale',
            onCallBack: (isError, fromApi) {
              if (isError) {
                print("Failed to load sale products");
              }
            },
          ),
        )
        .listen((productsList) {
          saleProducts = productsList.map((e) => e.toModel).toList();
          items.refresh();
        }, onError: (failure) {});
  }
}
