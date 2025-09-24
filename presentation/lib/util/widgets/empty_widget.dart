import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Text(AppTexts.nothingToShow, style: TextStyle(fontSize: 16, color: Colors.grey)),
      ),
    );
  }
}
