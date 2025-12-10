import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/greeting_page/greeting_page.dart';
import 'package:presentation/pages/welcome_page/welcome_page.dart';

final pages = [WelcomePage(), GreetingPage()];

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: [Colors.white, Colors.white70],
        itemCount: pages.length,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(Icons.navigate_next, size: 50),
        ),
        itemBuilder: (index) {
          return SafeArea(
            child: pages[index],
          );
        },
      ),
    );
  }
}

