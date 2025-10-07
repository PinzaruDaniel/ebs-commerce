import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase =
      GetIt.instance<GetProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  bool loadedExtraLists = false;
  StreamSubscription? _streamSubscription;

  void initItems() async {
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
      loadedExtraLists = false;
    }
    _streamSubscription?.cancel();

    _streamSubscription = getProductsUseCase
        .call(GetProductsParams(page: currentPage.value, perPage: perPage))
        .distinct()
        .listen(
          (list) async {
            if (loadMore) {
              isLoading.value = true;
              final newItems = list.map((e) => e.toModel).toList();
              final existingIds = products.map((p) => p.id).toSet();
              final uniqueNewItems = newItems
                  .where((item) => !existingIds.contains(item.id))
                  .toList();
              products.addAll(uniqueNewItems);
              isLoading.value = true;
            } else {
              products.assignAll(list.map((e) => e.toModel).toList());
              isLoading.value = false;
            }

            if (!loadedExtraLists && !loadMore && currentPage.value == 1) {
              loadedExtraLists = true;
              await getNewProducts();
              await getSaleProducts();
            }
            print('get from api controller ${list.length}');
            items.value = [
              AdBannerViewModel(),
              HorizontalProductListViewModel(
                products: newProducts,
                type: ProductListType.newProducts,
              ),
              HorizontalProductListViewModel(
                products: saleProducts,
                type: ProductListType.saleProducts,
              ),
              AllProductsViewItem(products: products),
            ];
            isLoading.value = false;
          },
          onError: (error) {
            isLoading.value = false;
          },
        );
  }

  Future<void> getNewProducts() async {
    isLoading.value=true;

    getProductsUseCase
        .call(GetProductsParams(page: 1, perPage: 5, marks: 'new'))
        .listen((productsList) {
          newProducts = productsList.map((e) => e.toModel).toList();
          items.refresh();
          isLoading.value=false;

    }, onError: (failure) {});
  }

  Future<void> getSaleProducts() async {
    isLoading.value=true;

    getProductsUseCase
        .call(GetProductsParams(page: 1, perPage: 5, marks: 'sale'))
        .listen((productsList) {
          saleProducts = productsList.map((e) => e.toModel).toList();
          items.refresh();
          isLoading.value=false;
        }, onError: (failure) {});
  }
}
