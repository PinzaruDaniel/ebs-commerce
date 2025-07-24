import 'package:get/get.dart';

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
