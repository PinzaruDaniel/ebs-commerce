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
    return
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () async {
          onRemove.call();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.primary,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min ,
            children: [
              Text(name, style: AppTextsStyle.medium.copyWith(color:Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(width: 4),
              Icon(Icons.close, color: Colors.white, size: 20),
            ],
          ),
        ),
      );
  }
}