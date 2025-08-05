import 'package:presentation/util/resources/app_images.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';

class HomeAdBannerWidget extends StatefulWidget {
  const HomeAdBannerWidget({super.key});

  @override
  State<HomeAdBannerWidget> createState() => _HomeAdBannerWidgetState();
}

class _HomeAdBannerWidgetState extends State<HomeAdBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(AppImages.adBanner, fit: BoxFit.fill, width: 300),
                      ),
                      Positioned(
                        left: 60,
                        child: Text(AppTexts.bestDiscounts, textAlign: TextAlign.center,
                          style: AppTextsStyle.bold(color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: Text(AppTexts.checkNewProducts),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
