import 'package:get/get.dart';
import 'package:presentation/pages/filtered_page/category_picker_page/category_controller.dart';
import 'package:presentation/pages/filtered_page/filter_controller.dart';
import 'package:presentation/view/category_view_model.dart';

import '../main_app_controller.dart';

class RootBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    /*var dataDi = GetIt.instance;

    dataDi.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(productsRepository: dataDi<ProductsRepository>()),
    );*/

    await Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
  }
}
