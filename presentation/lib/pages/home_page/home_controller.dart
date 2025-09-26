import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_products_local_use_case.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:domain/modules/products/use_cases/set_products_local_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../util/enum/enums.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  final SetProductsLocalUseCase setProductLocalUseCase = GetIt.instance<SetProductsLocalUseCase>();
  final GetProductsLocalUseCase getProductsLocalUseCase=GetIt.instance<GetProductsLocalUseCase>();
  RxList<BaseViewModel> items = RxList<BaseViewModel>([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading = true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];
  Rxn<Failure> failure = Rxn<Failure>();
  RxInt currentPage = 1.obs;
  int perPage = 20;
  RxBool isLoadingMore = false.obs;
  StreamSubscription? _cacheSubscription;


  void initItems() async {
    items.clear();
    items.add(AdBannerViewModel());
    await getProducts();
  }
  @override
  void onClose() {
    _cacheSubscription?.cancel();
    super.onClose();
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
      (failure) async {
         getProductsLocalCache();
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
        await setProductsLocalCache();

        if (!loadMore && currentPage.value == 1) {
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
    await getProductsUseCase.call(GetProductsParams(page: 1, perPage: 5, marks: 'new')).then((either) async {
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
    await getProductsUseCase.call(GetProductsParams(page: 1, perPage: 5, marks: 'sale')).then((either) async {
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

  Future<void> setProductsLocalCache() async {
    final productEntities = products.map((e) => e.toEntity).toList();
    print('Caching ${productEntities.length} ');
    await setProductLocalUseCase.call(productEntities);
    print(' cached');
  }

  void getProductsLocalCache() {
    _cacheSubscription = getProductsLocalUseCase.call().listen((cachedProducts) {
      print('Stream emitted ${cachedProducts.length} cached products');
      if (cachedProducts.isNotEmpty) {
        final cachedViewModels = cachedProducts.map((e) => e.toModel).toList();
        products.assignAll(cachedViewModels);
        items.value = [
          AdBannerViewModel(),
          HorizontalProductListViewModel(products: newProducts, type: ProductListType.newProducts),
          HorizontalProductListViewModel(products: saleProducts, type: ProductListType.saleProducts),
          AllProductsViewItem(products: products),
        ];
        isLoading.value = false;
      } else {
        print('No products in cache');
      }
    });
  }



}
