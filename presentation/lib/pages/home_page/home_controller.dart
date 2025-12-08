import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/products/use_cases/get_products_response_use_case.dart';
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
  final GetProductsResponseUseCase getProductsResponseUseCase = GetIt.instance<GetProductsResponseUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxList<ProductViewModel> newProducts = RxList([]);
  RxList<ProductViewModel> saleProducts = RxList([]);
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  StreamSubscription? _streamSubscription;

  Future<void> initItems() async {
    syncProducts();
    getPageFromCache();

    getProducts();
    items.addAll([
      AdBannerViewModel(),
      HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
      HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
      AllProductsViewItem(products: products),
    ]);
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  void getPageFromCache() {
    getProductsResponseUseCase.call(GetProductsResponseParams(currentPage: currentPage.value)).then((response) {
      if (response != null) {
        currentPage.value = response.last.currentPage;
        print('current page value getPageFromCache: ${currentPage.value}');
      } else {}
    });
  }

  Future<void> syncProducts() async {
    if (products.isEmpty) {
      mainAppController.addPendingIds([PendingIds.getProducts]);
    }

    await syncProductsUseCase.call(SyncProductsParams(page: currentPage.value, perPage: perPage));
    mainAppController.removePendingIds([PendingIds.getProducts]);
  }

  Future<void> getProducts({bool loadMore = false}) async {
    if (loadMore) {
      currentPage.value++;
      await syncProducts();
    }
    _streamSubscription?.cancel();

    _streamSubscription = streamProductsUseCase
        .call(StreamProductsParams(page: currentPage.value, perPage: perPage))
        .distinct()
        .listen((list) async {
          final mappedProducts = list.map((e) => e.toModel).toList();
          products.addAll(mappedProducts);
          products.refresh();
          await addNewSaleProduct();
        });

    consoleLog('products are empty get Products: ${products.isEmpty}');
  }

  Future<void> addNewSaleProduct() async {
    newProducts.value = products.where((e) => e.marks?.contains("new") ?? false).take(5).toList();
    saleProducts.value = products.where((e) => e.marks?.contains("sale") ?? false).take(5).toList();
    items.refresh();
  }
}
