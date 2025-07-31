import 'package:flutter/material.dart';
import 'package:presentation/themes/app_text_styles.dart';

import '../../themes/app_colors.dart';

class SelectedChipWidget extends StatelessWidget {
  const SelectedChipWidget({super.key, required this.id, required this.name, required this.onRemove});

  final int id;
  final String name;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: AppColors.primary,
      side: BorderSide(color: Colors.transparent),
      label: Text(name, style: AppTextsStyle.medium.copyWith(color:Colors.white, fontWeight: FontWeight.bold),),
      deleteIcon: Icon(Icons.close, color: Colors.white, size: 20),
      onDeleted: onRemove,
    );
  }
}
