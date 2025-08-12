import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:presentation/pages/contact_information_page/widgets/text_field_contact_info_widget.dart';
import 'package:presentation/view/base_view_model.dart';

class ContactInformationController extends GetxController{
  RxList<BaseViewModel> allItems=RxList([]);
  void initAllItems(){
    allItems.value=[
      TextFieldContactInfoViewModel(title: 'Name'),
      TextFieldContactInfoViewModel(title: 'Surname'),
      TextFieldContactInfoViewModel(title: 'Phone', textInputType: TextInputType.phone),
      TextFieldContactInfoViewModel(title: 'Email', textInputType: TextInputType.emailAddress),
    ];
  }

}
