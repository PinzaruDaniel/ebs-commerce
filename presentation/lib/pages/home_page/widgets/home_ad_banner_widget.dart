import 'package:presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

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
                        child: Image.asset('assets/banner/banner.png', fit: BoxFit.fill, width: 300),
                      ),
                      Positioned(
                        left: 60,
                        child: Text('ONLY in July we have\n the BEST discounts!!!', textAlign: TextAlign.center,
                          style: AppTextsStyle.bold.copyWith(color: Colors.white),),
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
                            child: Text('Check our new products!'),
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
