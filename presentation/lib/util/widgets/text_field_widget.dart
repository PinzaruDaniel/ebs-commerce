import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/view/base_view_model.dart';

class TextFieldViewModel extends BaseViewModel {
  final String title;
  final String? keyId;
  final TextInputType? textInputType;
  final bool isRequiredValidation;
  final String? Function(String?)? customValidator;
  String placeholder;
  int? minLines;

  TextFieldViewModel({
    this.keyId,
    required this.title,
    this.textInputType,
    this.customValidator,
    this.isRequiredValidation = true,
    String initialValue = '',
    this.minLines,
  }) : placeholder = initialValue;
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.itemViewModel});

  final TextFieldViewModel itemViewModel;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  var controller = TextEditingController();
  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.itemViewModel.placeholder);

    controller.addListener(() {
      widget.itemViewModel.placeholder = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
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
          FormField(
            validator: (text) {
              if (widget.itemViewModel.isRequiredValidation &&
                  (controller.text.isEmpty)) {
                return AppTexts.requiredField;
              }
              if (widget.itemViewModel.customValidator != null) {
                return widget.itemViewModel.customValidator!(controller.text);
              }
              return null;
            },
            builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(

                    controller: controller,
                    focusNode: focusNode,
                    minLines: widget.itemViewModel.minLines ?? 1,
                    maxLines: widget.itemViewModel.minLines != null ? null : 1,
                    keyboardType: widget.itemViewModel.textInputType ?? TextInputType.text,
                    textInputAction: TextInputAction.done,
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                      isDense: true,
                      errorText: state.errorText,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: AppColors.red, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: AppColors.redText, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
                      ),
                    ),
                    onChanged: (value) {
                      widget.itemViewModel.placeholder = value;
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
      ),
    );
  }
}
