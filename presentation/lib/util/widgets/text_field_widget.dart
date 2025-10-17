import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:flutter/services.dart';

class TextFieldViewModel extends BaseViewModel {
  final String? title;
  final String? keyId;
  final TextInputType? textInputType;
  final bool isRequiredValidation;
  final String? Function(String?)? customValidator;
  final List<LibPhonenumberTextFormatter>? inputFormatter;
  final TextEditingController? textController;
  String placeholder;
  int? minLines;

  TextFieldViewModel({
    this.keyId,
     this.title,
    this.textInputType,
    this.customValidator,
    this.inputFormatter,
    this.textController,
    this.isRequiredValidation = true,
    String initialValue = '',
    this.minLines,
  }) : placeholder = initialValue;
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.itemViewModel,
  });
  final TextFieldViewModel itemViewModel;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  late final bool _isExternalController;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Use external controller if provided, otherwise create one
    _isExternalController = widget.itemViewModel.textController != null;
    controller = widget.itemViewModel.textController ??
        TextEditingController(text: widget.itemViewModel.placeholder);

    controller.addListener(() {
      widget.itemViewModel.placeholder = controller.text;
    });
  }

  @override
  void dispose() {
    // Dispose only if it was internally created
    if (!_isExternalController) {
      controller.dispose();
    }
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.itemViewModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (vm.title != null) ...[
          Text(vm.title!),
          const SizedBox(height: 4),
        ],
        FormField(
          validator: (text) {
            if (vm.isRequiredValidation && controller.text.isEmpty) {
              return AppTexts.requiredField;
            }
            if (vm.customValidator != null) {
              return vm.customValidator!(controller.text);
            }
            return null;
          },
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  inputFormatters: vm.inputFormatter ??
                      (vm.textInputType == TextInputType.phone
                          ? [FilteringTextInputFormatter.digitsOnly]
                          : []),
                  controller: controller,
                  focusNode: focusNode,
                  minLines: vm.minLines ?? 1,
                  maxLines: vm.minLines != null ? null : 1,
                  keyboardType: vm.textInputType ?? TextInputType.text,
                  textInputAction: TextInputAction.done,
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    isDense: true,
                    errorText: state.errorText,
                    errorMaxLines: 3,
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: AppColors.red, width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.redText,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (vm.textInputType == TextInputType.phone) {
                      if (value.startsWith('0')) {
                        value = value.replaceFirst(RegExp(r'^0+'), '');
                      }
                      if (value.length > 15) {
                        value = value.substring(0, 15);
                      }
                      if (value != controller.text) {
                        controller.text = value;
                        controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: controller.text.length),
                        );
                      }
                    }
                    vm.placeholder = value;
                    state.validate();
                  },
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
