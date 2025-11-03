import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/routing/app_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text('Hello Human', style: AppTextsStyle.bold(size: 36)),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                AppRouter.openGreetingPage();
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Tap to continue',
                  style: AppTextsStyle.medium.copyWith(fontSize: 16, color: AppColors.greyText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
