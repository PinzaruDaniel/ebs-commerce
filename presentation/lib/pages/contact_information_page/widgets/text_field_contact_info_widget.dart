import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/view/base_view_model.dart';

class TextFieldContactInfoViewModel extends BaseViewModel {
  final String title;
  final TextInputType? textInputType;
  final RxString value=RxString('');

  TextFieldContactInfoViewModel({required this.title, this.textInputType});
}

class TextFieldContactInfoWidget extends StatelessWidget {
  const TextFieldContactInfoWidget({super.key, required this.itemViewModel});

  final TextFieldContactInfoViewModel itemViewModel;

  @override
  Widget build(BuildContext context) {
    final controller=TextEditingController(text: itemViewModel.value.value);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemViewModel.title),
          SizedBox(height: 4),
          Obx(() {
            controller.value=controller.value.copyWith(
              text: itemViewModel.value.value,
              selection: TextSelection.collapsed(offset: itemViewModel.value.value.length),
            );

            return TextField(
              cursorColor: AppColors.primary,
              keyboardType: itemViewModel.textInputType ?? TextInputType.text,
              onChanged: (text)=> itemViewModel.value.value=text,
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
                ),
              ),
            );
          }
          ),
        ],
      ),
    );
  }
}
