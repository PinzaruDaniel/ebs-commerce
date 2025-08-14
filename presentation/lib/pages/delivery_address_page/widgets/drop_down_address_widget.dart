import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/view/base_view_model.dart';

class DropdownAddressViewModel extends BaseViewModel {
  final String title;
  final RxString selectedValue;
  final List<String> options;
  final Function(String)? onChanged;



  DropdownAddressViewModel( {
    required this.title,
    required String initialValue,
    required this.options,
    this.onChanged,
  }) : selectedValue = initialValue.obs;

  void updateValue(String newValue){
    selectedValue.value=newValue;
    if(onChanged!=null){
      onChanged!(newValue);
    }
  }
}

class DropDownAddressWidget extends StatelessWidget {
  final DropdownAddressViewModel itemViewModel;

  const DropDownAddressWidget({super.key, required this.itemViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
            () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemViewModel.title),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: itemViewModel.selectedValue.value.isNotEmpty
                  ? itemViewModel.selectedValue.value
                  : null,
              items: itemViewModel.options
                  .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  itemViewModel.selectedValue.value = newValue;
                }
              },
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}