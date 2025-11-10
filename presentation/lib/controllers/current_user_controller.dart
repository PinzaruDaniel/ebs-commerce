import 'dart:async';
import 'package:common/constants/logger.dart';
import 'package:domain/modules/settings/models/index.dart';
import 'package:domain/modules/settings/use_cases/get_settings_use_case.dart';
import 'package:domain/modules/settings/use_cases/set_settings_use_case.dart';
import 'package:domain/modules/user_information/use_cases/stream_user_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/user_mapper.dart';

import '../view/user_view_model.dart';

class CurrentUserController extends GetxController {
  StreamUserUseCase streamUserUseCase = GetIt.instance<StreamUserUseCase>();
  SetSettingsUseCase setSettingsUseCase = GetIt.instance<SetSettingsUseCase>();
  GetSettingsUseCase getSettingsUseCase = GetIt.instance<GetSettingsUseCase>();
  Rxn<UserViewModel> userVM = Rxn<UserViewModel>();
  RxBool hasAgreedTerms = RxBool(false);
  bool isUserFromApi = false;

  StreamSubscription? _streamSubscription;

  RxBool get isUserLogged => RxBool(userVM.value != null);

  @override
  void onInit() {
    super.onInit();
    getSettings();
    streamUser();
  }

  Future<void> getSettings() async {
    await getSettingsUseCase.call().then((either) {
      either.fold((failure) {}, (entity) {
        hasAgreedTerms.value = entity.hasAgreedTerms;
      });
    });
  }

  Future<void> setSettings() async {
    await setSettingsUseCase.call(SetSettingsParams(settings: SettingsEntity(hasAgreedTerms: hasAgreedTerms.value)));
  }

  Future<void> streamUser() async {
    _streamSubscription?.cancel();
    _streamSubscription = streamUserUseCase.call().distinct().listen((userEntity) {
      userVM.value = userEntity?.toModel;

      consoleLog('userEntity photo: ${userEntity?.imageUrl ?? 'no image'}');
    });
  }

  Future<void> clearUserData() async {
    await _streamSubscription?.cancel();
    _streamSubscription = null;
    userVM.value = null;
  }
}
