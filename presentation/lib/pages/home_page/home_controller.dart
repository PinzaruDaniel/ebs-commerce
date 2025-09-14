import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_new_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:domain/modules/products/use_cases/get_sale_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  final GetSaleProductsUseCase getSaleProductsUseCase = GetIt.instance<GetSaleProductsUseCase>();
  final GetNewProductsUseCase getNewProductsUseCase = GetIt.instance<GetNewProductsUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  RxBool isLoadingMore = false.obs;

  void initItems() {
    items.clear();
    items.add(AdBannerViewModel());
    getProducts();
  }

  Future<void> getProducts({bool loadMore = false}) async {
    if (loadMore) {
      if (isLoadingMore.value) return;
      isLoadingMore.value = true;
      currentPage.value++;
    } else {
      isLoading.value = true;
      products.clear();
      currentPage.value = 1;
    }
    final either = await getProductsUseCase.call(GetProductsParams(page: currentPage.value, perPage: perPage));

    either.fold(
          (failure) {
        isLoading.value = false;
        isLoadingMore.value = false;
        showFailureSnackBar(failure: failure);
      },
          (list) async {
        final newItems = list.map((e) => e.toModel).toList();

        if (loadMore) {
          products.addAll(newItems);
        } else {
          products.assignAll(newItems);
        }
        if(!loadMore && currentPage.value==1){
          await getNewProducts();
          await getSaleProducts();
        }

        items.value = [
          AdBannerViewModel(),
          HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
          HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
          AllProductsViewItem(products: products),
        ];

        isLoading.value = false;
        isLoadingMore.value = false;
      },
    );
  }

  Future<void> getNewProducts() async {
    await getNewProductsUseCase.call(GetNewProductsParams(page: 1, perPage: 5)).then((either) async {
      either.fold(
            (failure) {
          isLoading.value = false;
        },

            (products) async {
          newProducts = products.map((e) => e.toModel).toList();
        },
      );
    });
  }

  Future<void> getSaleProducts({bool loadMore = false}) async {
    await getSaleProductsUseCase.call(GetSaleProductsParams(page: 1, perPage: 5)).then((either) async {
      either.fold(
            (failure) {
          isLoading.value = false;
          isLoadingMore.value = false;
        },

            (products) async {
          saleProducts = products.map((e) => e.toModel).toList();
        },
      );
    });
  }
}