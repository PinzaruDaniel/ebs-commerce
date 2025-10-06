import 'dart:async';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/products/use_cases/get_products_use_case.dart';
import 'package:domain/modules/products/use_cases/set_products_cached_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_view_model.dart';
import '../../view/base_view_model.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase = GetIt.instance<GetProductsUseCase>();
  final SetProductsCachedUseCase setProductsCachedUseCase = GetIt.instance<SetProductsCachedUseCase>();

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
    items.clear();
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
    } else {
      isLoading.value = true;
      products.clear();
    }
    _streamSubscription?.cancel();

    _streamSubscription = getProductsUseCase
        .call(GetProductsParams(page: currentPage.value, perPage: perPage))
        .distinct()
        .listen(
          (list) async {
            final newItems = list.map((e) => e.toModel).toList();
            if (loadMore) {
              products.addAll(newItems);
            } else {
              products.assignAll(newItems);
            }
            setProductsCachedUseCase.call(list);
            print('get from api controller ${list.length}');
            items.value = [AdBannerViewModel(), AllProductsViewItem(products: products)];
            isLoading.value = false;
          },
          onError: (error) {
            isLoading.value = false;
          },
        );
  }

  Future<void> getNewProducts() async {
    getProductsUseCase
        .call(
          GetProductsParams(
            page: 1,
            perPage: 5,
            marks: 'new',
            /*onCallBack: (isError, fromApi) {
              if (isError) {
                print("Error from API new");
              } else if (!fromApi) {
                print("Using cached data new");
              } else {
                print("Loaded fresh data from API new");
              }
            },*/
          ),
        )
        .listen((productsList) {
          newProducts = productsList.map((e) => e.toModel).toList();
          Future.delayed(Duration(milliseconds: 100));
          items.refresh();
        }, onError: (failure) {});
  }

  Future<void> getSaleProducts() async {
    getProductsUseCase
        .call(
          GetProductsParams(
            page: 1,
            perPage: 5,
            marks: 'sale',
            /*onCallBack: (isError, fromApi) {
              if (isError) {
                print("Error from API sale ");
              } else if (!fromApi) {
                print("Using cached data sale");
              } else {
                print("Loaded fresh data from API sale");
              }
            },*/
          ),
        )
        .listen((productsList) {
          saleProducts = productsList.map((e) => e.toModel).toList();
          Future.delayed(Duration(milliseconds: 100));
          items.refresh();
        }, onError: (failure) {});
  }
}
