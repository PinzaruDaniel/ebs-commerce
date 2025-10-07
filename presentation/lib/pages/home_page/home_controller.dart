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
      isLoading.value = true;
    } else {
      currentPage.value = 1;
      isLoading.value = true;
      products.clear();
    }
    if (products.value.isNotEmpty) {
      var pageNumber = products.length / 20;
      currentPage.value == pageNumber;
    }
    _streamSubscription?.cancel();
    _streamSubscription = getProductsUseCase
        .call(GetProductsParams(page: currentPage.value, perPage: perPage))
        .distinct()
        .listen(
          (list) async {
            if (loadMore) {
              final newItems = list.map((e) => e.toModel).toList();
              final existingIds = products.map((p) => p.id).toSet();
              final uniqueNewItems = newItems.where((item) => !existingIds.contains(item.id)).toList();
              products.addAll(uniqueNewItems);
            } else {
              products.assignAll(list.map((e) => e.toModel).toList());
              if (currentPage.value == 1) {
                newProducts = products.where((e) => e.marks?.contains("new") ?? false).take(5).toList();
                saleProducts = products.where((e) => e.marks?.contains("sale") ?? false).take(5).toList();
              }
            }
            items.value = [
              AdBannerViewModel(),
              HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
              HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
              AllProductsViewItem(products: products),
            ];
            await Future.delayed(Duration(seconds: 1));
            isLoading.value = false;
          },

          onError: (error) {
            isLoading.value = false;
          },
        );
  }
}
