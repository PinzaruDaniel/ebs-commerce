// ignore_for_file: invalid_use_of_protected_member
import 'package:common/constants/debouncer_class.dart';
import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/stream_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../util/enum/enums.dart';
import '../../util/routing/app_pop_up.dart';
import '../../view/product_view_model.dart';

class ProductsDisplayController extends GetxController {
  final StreamProductsUseCase getProductsUseCase = GetIt.instance<StreamProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase = GetIt.instance<GetNewProductsUseCase>();
  final GetSaleProductsUseCase getSaleProductsUseCase = GetIt.instance<GetSaleProductsUseCase>();
  final GetFilteredProductsUseCase getFilteredProductsUseCase = GetIt.instance<GetFilteredProductsUseCase>();
  final Debouncer debouncer = Debouncer(milliseconds: 750);
  List<ProductViewModel> products = RxList([]);

  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;


  Future<void> loadProducts({
    bool loadMore = false,
    required ProductListType productType,
    List<int>? selectedCategoryIds,
    SfRangeValues? priceRange,
    String? searchProduct,
  }) async {
    consoleLog('searching for: $searchProduct}');
    if (loadMore) {
      currentPage.value++;
    } else {
      currentPage.value = 1;
      products.clear();
    }

    try {
      switch (productType) {
        case ProductListType.newProducts:
          await getNewProducts(loadMore, searchProduct);
          break;
        case ProductListType.saleProducts:
          await getSaleProducts(loadMore, searchProduct);
          break;

        case ProductListType.filteredProducts:
          await getFilteredProducts(loadMore, selectedCategoryIds, priceRange, searchProduct);
          break;

        default:
          return;
      }
    } finally {}
  }

  Future<void> getSaleProducts(bool loadMore, String? searchProduct) async {
    if (!loadMore) {
      mainAppController.addPendingIds([PendingIds.getProducts]);
    }

    await getSaleProductsUseCase
        .call(GetSaleProductsParams(page: currentPage.value, perPage: perPage, searchProduct: searchProduct))
        .then((either) {
          either.fold(
            (failure) {
              mainAppController.removePendingIds([PendingIds.getProducts]);
              if (failure.code == '404') {
                AppPopUp.showFailureSnackBar(title: AppTexts.oops, fallbackMessage: AppTexts.noProductsToShow);
              }
            },
            (list) {
              final newItems = list.map((e) => e.toModel).toList();
              if (loadMore) {
                products.addAll(newItems);
              } else {
                products.assignAll(newItems);
                mainAppController.removePendingIds([PendingIds.getProducts]);
              }
            },
          );
        });
  }

  Future<void> getNewProducts(bool loadMore, String? searchProduct) async {
    if (!loadMore) {
      mainAppController.addPendingIds([PendingIds.getProducts]);
    }

    await getNewProductsUseCase
        .call(GetNewProductsParams(page: currentPage.value, perPage: perPage, searchProduct: searchProduct))
        .then((either) {
          either.fold(
            (failure) {
              mainAppController.removePendingIds([PendingIds.getProducts]);
              if (failure.code == '404') {
                AppPopUp.showFailureSnackBar(title: AppTexts.oops, fallbackMessage: AppTexts.noProductsToShow);
              }
            },
            (list) {
              final newItems = list.map((e) => e.toModel).toList();
              if (loadMore) {
                products.addAll(newItems);
              } else {
                products.assignAll(newItems);
                mainAppController.removePendingIds([PendingIds.getProducts]);
              }
            },
          );
        });
  }

  Future<void> getFilteredProducts(
    bool loadMore,
    List<int>? selectedCategoryIds,
    SfRangeValues? priceRange,
    String? searchProduct,
  ) async {
    if (!loadMore) {
      mainAppController.addPendingIds([PendingIds.getProducts]);
    }
    final either = await getFilteredProductsUseCase.call(
      GetFilteredProductsParams(
        page: currentPage.value,
        priceGte: priceRange?.start ?? 1,
        priceLte: priceRange?.end ?? 50000,
        categoriesId: selectedCategoryIds,
        searchProduct: searchProduct,
      ),
    );

    either.fold(
      (failure) {
        mainAppController.removePendingIds([PendingIds.getProducts]);
        if (failure.code == '404') {
          AppPopUp.showFailureSnackBar(title: AppTexts.oops, fallbackMessage: AppTexts.noProductsToShow);
        }
      },
      (responseEntity) {
        final items = responseEntity.response.map((e) => e.toModel).toList();
        if (loadMore) {
          products.addAll(items);
        } else {
          products.assignAll(items);
          mainAppController.removePendingIds([PendingIds.getProducts]);
        }
      },
    );
  }
}
