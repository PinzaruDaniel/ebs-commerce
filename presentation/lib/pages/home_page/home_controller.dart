import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/stream_products_use_case.dart';
import 'package:domain/modules/products/use_cases/sync_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final StreamProductsUseCase streamProductsUseCase = GetIt.instance<StreamProductsUseCase>();
  final SyncProductsUseCase syncProductsUseCase = GetIt.instance<SyncProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  RxList<ProductViewModel> newProducts = RxList([]);
  RxList<ProductViewModel> saleProducts = RxList([]);
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  StreamSubscription? _streamSubscription;

  void initItems() async {
    items.value = [
      AdBannerViewModel(),
      HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
      HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
      AllProductsViewItem(products: products),
    ];
    getProducts(loadMore: true);
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  Future<void> syncProducts() async {
    mainAppController.addPendingIds([PendingIds.getProducts]);
    isLoading.value = true;
    final either = await syncProductsUseCase.call(SyncProductsParams(page: currentPage.value, perPage: perPage));
    either.fold(
      (failure) {
        isLoading.value = false;
        mainAppController.removePendingIds([PendingIds.getProducts]);
      },
      (list) {
        final newItems = list.map((e) => e.toModel).toList();
        products.addAll(newItems);
        newProducts.value = products.where((e) => e.marks?.contains("new") ?? false).take(5).toList();
        saleProducts.value = products.where((e) => e.marks?.contains("sale") ?? false).take(5).toList();
        items.refresh();
        isLoading.value = false;
        currentPage.value++;
        mainAppController.removePendingIds([PendingIds.getProducts]);
      },
    );
  }

  Future<void> getProducts({bool loadMore = false}) async {
    if (loadMore) {
      await syncProducts();
    }
    _streamSubscription?.cancel();
    _streamSubscription = streamProductsUseCase
        .call(StreamProductsParams(page: currentPage.value, perPage: perPage))
        .distinct()
        .listen((list) {
          final mappedProducts = list.map((e) => e.toModel).toList();
          products.assignAll(mappedProducts);
        });
  }
}
