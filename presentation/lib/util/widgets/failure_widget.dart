import 'package:common/constants/failure_class.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_text_styles.dart';

import '../../pages/home_page/widgets/home_ad_banner_widget.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;
  const FailureWidget({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAdBannerWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300.withValues(alpha: 0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    failure.message,
                    style: AppTextsStyle.bold,
                  ),
                ),
              ),
          ),
        ),
      ],
    );
  }
}
