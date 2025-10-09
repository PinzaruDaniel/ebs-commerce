import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:domain/modules/products/use_cases/sync_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../util/widgets/failure_snack_bar_widget.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  final SyncProductsUseCase syncProductsUseCase = GetIt.instance<SyncProductsUseCase>();
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
    getProducts();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }


  Future<void> syncProducts() async {
    syncProductsUseCase.call(SyncProductsParams(page: currentPage.value, perPage: perPage)).then((either) {
      either.fold(
        (failure) {
          isLoading.value = false;
          showFailureSnackBar(failure: failure);
        },
        (list) {
          final newItems = list.map((e) => e.toModel).toList();
          products.addAll(newItems);
        },
      );
    });
  }


  Future<void> getProducts({bool loadMore = false}) async {
    final completer = Completer<void>();

    if (loadMore) {
      //todo: sync get from api as future function
      //TODO: add to completer future function of sync
      completer.complete(syncProducts());
      currentPage.value++;
    } else {
      currentPage.value = 1;
      products.clear();
    }
    if (products.value.isNotEmpty) {
      var pageNumber = products.length / 20;
      currentPage.value == pageNumber;
    }
    isLoading.value = true;

    _streamSubscription?.cancel();
    int emissionCount = 0;
    bool hasCompleted = false;


    items.value = [
      AdBannerViewModel(),
      HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
      HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
      AllProductsViewItem(products: products),
    ];

    _streamSubscription = getProductsUseCase
        .call(GetProductsParams(page: currentPage.value, perPage: perPage))
        .distinct()
        .listen(
          (list) {
            emissionCount++;
            final mappedProducts = list.map((e) => e.toModel).toList();

            if (loadMore) {
              final existingIds = products.map((p) => p.id).toSet();
              final uniqueNewItems = mappedProducts.where((item) => !existingIds.contains(item.id)).toList();
              products.addAll(uniqueNewItems);
            } else {
              products.assignAll(mappedProducts);
            }

            newProducts = products.where((e) => e.marks?.contains("new") ?? false).take(5).toList();
            saleProducts = products.where((e) => e.marks?.contains("sale") ?? false).take(5).toList();

            if (emissionCount >= 2 && !hasCompleted) {
              isLoading.value = false;
              if (!completer.isCompleted) completer.complete();
              hasCompleted = true;
            }

            if (emissionCount == 1) {
              Future.delayed(const Duration(seconds: 2), () {
                if (!hasCompleted) {
                  items.refresh();

                  isLoading.value = false;
                  if (!completer.isCompleted) completer.complete();
                  hasCompleted = true;
                }
              });
            }
          },
          onError: (error) {
            isLoading.value = false;
            if (!completer.isCompleted) completer.completeError(error);
          },
        );

    return completer.future;
  }
}
