import 'package:get/get.dart';
import '../main_app_controller.dart';

class RootBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
  }
}
