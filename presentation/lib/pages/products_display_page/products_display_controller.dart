// ignore_for_file: invalid_use_of_protected_member
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/stream_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../util/enum/enums.dart';
import '../../util/widgets/failure_snack_bar_widget.dart';
import '../../view/product_view_model.dart';

class ProductsDisplayController extends GetxController {
  final StreamProductsUseCase getProductsUseCase =
      GetIt.instance<StreamProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase =
      GetIt.instance<GetNewProductsUseCase>();
  final GetSaleProductsUseCase getSaleProductsUseCase =
      GetIt.instance<GetSaleProductsUseCase>();
  final GetFilteredProductsUseCase getFilteredProductsUseCase =
      GetIt.instance<GetFilteredProductsUseCase>();
  RxBool isLoading = true.obs;
  List<ProductViewModel> products = RxList([]);

  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  RxBool isLoadingMore = false.obs;

  Future<void> loadProducts({
    bool loadMore = false,
    required ProductListType productType,
    List<int>? selectedCategoryIds,
    SfRangeValues? priceRange,
  }) async {
    if (loadMore) {
      currentPage.value++;
      if (isLoadingMore.value) return;
    } else {
      isLoading.value = true;
      currentPage.value = 1;
      products.clear();
    }

    try {
      switch (productType) {
        case ProductListType.newProducts:
          await getNewProducts(loadMore);
          break;
        case ProductListType.saleProducts:
          await getSaleProducts(loadMore);
          break;

        case ProductListType.filteredProducts:
          await getFilteredProducts(loadMore, selectedCategoryIds, priceRange);
          break;

        default:
          return;
      }
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }

    isLoading.value = false;
    isLoadingMore.value = false;
  }

  Future<void> getSaleProducts(bool loadMore) async {
    await getSaleProductsUseCase
        .call(GetSaleProductsParams(page: currentPage.value, perPage: perPage))
        .then((either) {
          either.fold(
            (failure) {
              isLoading.value = false;
              isLoadingMore.value = false;
              showFailureSnackBar(failure: failure);
            },
            (list) {
              final newItems = list.map((e) => e.toModel).toList();
              if (loadMore) {
                products.addAll(newItems);
              } else {
                products.assignAll(newItems);
              }
            },
          );
        });
  }

  Future<void> getNewProducts(bool loadMore) async {
    await getNewProductsUseCase
        .call(GetNewProductsParams(page: currentPage.value, perPage: perPage))
        .then((either) {
          either.fold(
            (failure) {
              isLoading.value = false;
              isLoadingMore.value = false;
              showFailureSnackBar(failure: failure);
            },
            (list) {
              final newItems = list.map((e) => e.toModel).toList();
              if (loadMore) {
                products.addAll(newItems);
              } else {
                products.assignAll(newItems);
              }
            },
          );
        });
  }

  Future<void> getFilteredProducts(
    bool loadMore,
    List<int>? selectedCategoryIds,
    SfRangeValues? priceRange,
  ) async {
    final either = await getFilteredProductsUseCase.call(
      GetFilteredProductsParams(
        page: currentPage.value,
        priceGte: priceRange?.start??1,
        priceLte: priceRange?.end??50000,
        categoriesId: selectedCategoryIds,
      ),
    );

    either.fold(
      (failure) {
        isLoading.value = false;
        isLoadingMore.value = false;
        showFailureSnackBar(failure: failure);
      },
      (responseEntity) {
        final items = responseEntity.response.map((e) => e.toModel).toList();
        if (loadMore) {
          products.addAll(items);
        } else {
          products.assignAll(items);
        }
      },
    );
  }
}
