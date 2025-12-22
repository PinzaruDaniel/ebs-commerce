import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/view/base_view_model.dart';

import '../resources/app_icons.dart';

class TextFieldViewModel extends BaseViewModel {
  final String? title;
  final String? keyId;
  final String? countryCode;
  final TextInputType? textInputType;
  final bool isRequiredValidation;
  final String? Function(String?)? customValidator;
  final List<LibPhonenumberTextFormatter>? inputFormatter;
  final TextEditingController? textController;
  String placeholder;
  int? minLines;
  String? hintText;
  final FilteringTextInputFormatter? filteringTextInputFormatter;
  final Function(String)? onChanged;

  TextFieldViewModel({
    this.keyId,
    this.title,
    this.countryCode,
    this.textInputType,
    this.customValidator,
    this.inputFormatter,
    this.textController,
    this.isRequiredValidation = true,
    this.hintText,
    this.onChanged,
    this.filteringTextInputFormatter,
    String initialValue = '',

    this.minLines,
  }) : placeholder = initialValue;
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.itemViewModel, this.suffixIcon, this.obscureText = false});

  final Widget? suffixIcon;
  final bool obscureText;
  final TextFieldViewModel itemViewModel;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller = TextEditingController();
  bool _isExternalController = false;
  final focusNode = FocusNode();
  String? parsedData;
  GlobalKey<FormFieldState> _fieldKey = GlobalKey();
  String? _fieldError;

  @override
  void initState() {
    super.initState();
    _isExternalController = widget.itemViewModel.textController != null;
    controller = widget.itemViewModel.textController ?? TextEditingController(text: widget.itemViewModel.placeholder);
    _fieldKey = GlobalKey<FormFieldState>(debugLabel: widget.itemViewModel.keyId);
    //TODO: onTap with debounce
    controller.addListener(() {
      widget.itemViewModel.placeholder = controller.text;
    });
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _onFieldUnfocused(controller.text);
      }
    });
  }

  @override
  void dispose() {
    if (!_isExternalController) {
      controller.dispose();
    }
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.itemViewModel.title != null) ...[
          Text(widget.itemViewModel.title!, style: AppTextsStyle.medium.copyWith(color: Colors.grey.shade600)),
          const SizedBox(height: 4),
        ],
        FormField(
          key: _fieldKey,
          validator: (text) {
            if (widget.itemViewModel.isRequiredValidation && controller.text.isEmpty) {
              return AppTexts.requiredField;
            }
            if (_fieldError != null) {
              return _fieldError;
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
                  obscureText: widget.obscureText,
                  inputFormatters: widget.itemViewModel.filteringTextInputFormatter == null
                      ? widget.itemViewModel.inputFormatter ??
                            (widget.itemViewModel.textInputType == TextInputType.phone
                                ? [FilteringTextInputFormatter.digitsOnly]
                                : [])
                      : [?widget.itemViewModel.filteringTextInputFormatter],
                  controller: controller,
                  focusNode: focusNode,
                  minLines: widget.itemViewModel.minLines ?? 1,
                  maxLines: widget.itemViewModel.minLines != null ? null : 1,
                  keyboardType: widget.itemViewModel.textInputType ?? TextInputType.text,
                  textInputAction: TextInputAction.done,
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    suffixIcon: widget.suffixIcon,
                    prefixIcon: widget.itemViewModel.hintText == AppTexts.search ? AppIcons.searchIcon : null,
                    hintText: widget.itemViewModel.hintText,
                    hintStyle: AppTextsStyle.medium.copyWith(color: Colors.grey.shade500),
                    isDense: true,
                    errorText: state.errorText,
                    errorMaxLines: 3,
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
                    if (widget.itemViewModel.onChanged != null) {
                      widget.itemViewModel.onChanged?.call(value);
                    } else {
                      if (widget.itemViewModel.textInputType == TextInputType.phone) {
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
                      if (_fieldError != null) {
                        setState(() {
                          _fieldError = null;
                        });
                      }
                      widget.itemViewModel.placeholder = value;
                      state.validate();
                    }
                  },
                  onFieldSubmitted: (value) async {
                    await _onFieldUnfocused(value);
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

  Future<void> _onFieldUnfocused(String text) async {
    if (widget.itemViewModel.textInputType == TextInputType.phone) {
      try {
        final parsed = await parse(text, region: widget.itemViewModel.countryCode);

        const JsonEncoder encoder = JsonEncoder.withIndent('  ');

        if (!mounted) return;

        setState(() {
          parsedData = encoder.convert(parsed);
          _fieldError = null;
        });
      } catch (e) {
        if (!mounted) return;
        setState(() {
          parsedData = null;
          _fieldError = AppTexts.invalidNumberPhone;
        });
        _fieldKey.currentState?.validate();
      }
    }
  }
}
