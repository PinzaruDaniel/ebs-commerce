import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/view/base_view_model.dart';

class TextFieldViewModel extends BaseViewModel {
  final String title;
  final TextInputType? textInputType;
  final RxString value;

  TextFieldViewModel({required this.title, this.textInputType, String initialValue = ''}) : value = initialValue.obs;
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.itemViewModel});

  final TextFieldViewModel itemViewModel;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.itemViewModel.value.value);

    controller.addListener(() {
      widget.itemViewModel.value.value = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.itemViewModel.title),
          const SizedBox(height: 4),
          Obx(() {
            if (controller.text != widget.itemViewModel.value.value) {
              controller.text = widget.itemViewModel.value.value;
              controller.selection = TextSelection.collapsed(offset: controller.text.length);
            }
            return TextField(
              controller: controller,
              cursorColor: AppColors.primary,
              keyboardType: widget.itemViewModel.textInputType ?? TextInputType.text,
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
          }),
        ],
      ),
    );
  }
}