import 'package:get/get.dart';
import 'package:presentation/controllers/current_user_controller.dart';
import 'package:presentation/controllers/internet_controller.dart';
import 'package:presentation/controllers/nomenclature_controller.dart';

import '../main_app_controller.dart';

class RootBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
    await Get.putAsync<CurrentUserController>(() async => CurrentUserController(), permanent: true);
    await Get.putAsync<InternetController>(() async => InternetController(), permanent: true);
    await Get.putAsync<NomenclatureController>(() async => NomenclatureController(), permanent: true);
  }
}
