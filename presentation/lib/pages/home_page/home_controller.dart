import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/products/use_cases/clear_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_response_use_case.dart';
import 'package:domain/modules/products/use_cases/stream_products_use_case.dart';
import 'package:domain/modules/products/use_cases/sync_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/controllers/util/error_parser.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final StreamProductsUseCase streamProductsUseCase = GetIt.instance<StreamProductsUseCase>();
  final SyncProductsUseCase syncProductsUseCase = GetIt.instance<SyncProductsUseCase>();
  final GetProductsResponseUseCase getProductsResponseUseCase = GetIt.instance<GetProductsResponseUseCase>();
  final ClearProductsUseCase clearProductsUseCase = GetIt.instance<ClearProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxList<ProductViewModel> newProducts = RxList([]);
  RxList<ProductViewModel> saleProducts = RxList([]);
  ErrorParser errorParser = ErrorParser();
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  RxInt maxPage = 100.obs;
  int perPage = 20;
  StreamSubscription? _streamSubscription;

  Future<void> initItems() async {
    syncProducts(refresh: true);
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
        maxPage.value = response;
        maxPage.refresh();
      } else {}
    });
  }

  Future<void> clearProducts() async {
    await clearProductsUseCase.call();
  }

  Future<void> syncProducts({bool refresh = false}) async {
    if (products.isEmpty) {
      mainAppController.addPendingIds([PendingIds.getProducts]);
    }
    if (refresh) {
      currentPage.value = 1;
      currentPage.refresh();
    }

    await syncProductsUseCase.call(SyncProductsParams(page: currentPage.value, perPage: perPage)).then((either) {
      either.fold(
        (failure) {
          var errorMessage = errorParser.handleError(failure: failure);
          AppPopUp.showFailureSnackBar(fallbackMessage: errorMessage);
          mainAppController.removePendingIds([PendingIds.getProducts]);
        },
        (response) {
          mainAppController.removePendingIds([PendingIds.getProducts]);
          if (currentPage.value == maxPage.value) {
            currentPage.value = maxPage.value;
          } else {}
          //currentPage.value++;
        },
      );
    });
    mainAppController.removePendingIds([PendingIds.getProducts]);
  }

  Future<void> getProducts({bool loadMore = false}) async {
    if (loadMore) {
      currentPage.value++;
      await syncProducts();
      consoleLog('current page value after sync products: ${currentPage.value}');
    }
    _streamSubscription?.cancel();
    if (!(currentPage.value == maxPage.value)) {
      _streamSubscription = streamProductsUseCase
          .call(StreamProductsParams(page: currentPage.value, perPage: perPage))
          .distinct()
          .listen((list) async {
            final mappedProducts = list.map((e) => e.toModel).toList();
            products.addAll(mappedProducts);
            products.refresh();
            await addNewSaleProduct();
            consoleLog('is connected value log: ${!internetController.isConnected.value}');
            if (!internetController.isConnected.value) {
              getPageFromCache();
              if (currentPage.value == maxPage.value) {
                currentPage.value = maxPage.value;
              }
            }
          });
    } else {
      AppPopUp.showFailureSnackBar(fallbackMessage: '');
    }
  }

  Future<void> addNewSaleProduct() async {
    newProducts.value = products.where((e) => e.marks?.contains("new") ?? false).take(5).toList();
    saleProducts.value = products.where((e) => e.marks?.contains("sale") ?? false).take(5).toList();
    items.refresh();
  }
}
