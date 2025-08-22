// ignore_for_file: invalid_use_of_protected_member

import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import '../../controllers/controller_imports.dart';
import '../../util/widgets/failure_snack_bar_widget.dart';
import '../../view/product_view_model.dart';
import '../shopping_cart_page/enum/product_type.dart';


class ProductsDisplayController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  final GetSaleProductsUseCase getSaleProductsUseCase = GetIt.instance<GetSaleProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase = GetIt.instance<GetNewProductsUseCase>();
  RxBool isLoading = true.obs;
  List<ProductViewModel> products = RxList([]);

  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  RxBool isLoadingMore = false.obs;






  Future<void> loadProducts({bool loadMore = false, required ProductListType productType}) async {
    if (loadMore) {
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
          await getFilteredProducts(loadMore);
          break;

          default:
            return;
      }
      if (loadMore) {
        currentPage.value++;
      }
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }

    isLoading.value = false;
    isLoadingMore.value = false;
  }

  Future<void> getSaleProducts(bool loadMore) async {
    final either = await getSaleProductsUseCase.call(GetSaleProductsParams(page: currentPage.value, perPage: perPage));
    either.fold(
      (failure) {
        isLoading.value = false;
        isLoadingMore.value = false;
        showFailureSnackBar(failure);
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
  }

  Future<void> getNewProducts(bool loadMore) async {
    final either = await getNewProductsUseCase.call(GetNewProductsParams(page: currentPage.value, perPage: perPage));

    either.fold(
      (failure) {
        isLoading.value = false;
        isLoadingMore.value = false;
        showFailureSnackBar(failure);
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
  }

  Future<void> getFilteredProducts(bool loadMore) async {
    if (!loadMore) {
      currentPage.value = 1;
    }

    await filterController.getFilteredProducts(page: currentPage.value);

    if (loadMore) {
      products.addAll(filterController.filteredProducts);
      currentPage.value++;
    } else {
      products.assignAll(filterController.filteredProducts);
    }
  }
}