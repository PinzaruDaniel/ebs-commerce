import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import '../../controllers/controller_imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBorder: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 3, spreadRadius: 0.3, color: Colors.black26)],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            currentUserController.userVM.value?.imageUrl ??
                                'https://cdn-icons-png.flaticon.com/512/6522/6522516.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${currentUserController.userVM.value?.name ?? ''} '
                                '${currentUserController.userVM.value?.surname ?? ''}',
                                style: AppTextsStyle.medium.copyWith(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                currentUserController.userVM.value?.email ?? '',
                                style: AppTextsStyle.medium.copyWith(fontSize: 16),
                              ),
                              Text(currentUserController.userVM.value?.number ?? ''),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
