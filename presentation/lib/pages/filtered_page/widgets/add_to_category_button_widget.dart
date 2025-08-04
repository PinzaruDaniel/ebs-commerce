import 'package:flutter/material.dart';

import '../../../util/resources/app_text_styles.dart';
import '../../../util/routing/app_router.dart';

class AddToCategoryButtonWidget extends StatelessWidget {
  const AddToCategoryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () async {
        AppRouter.openCategoryPickerPage();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Text(
              'Add Category',
              style: AppTextsStyle.medium.copyWith(
                color: Color(0xff6b6d81),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.add, size: 20, color: Color(0xff6b6d81)),
          ],
        ),
      ),
    );
  }
}
