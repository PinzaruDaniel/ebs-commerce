import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/contact_information_page/contact_information_controller.dart';

import 'package:presentation/pages/contact_information_page/contact_information_page.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/resources/app_colors.dart';

class CheckoutContactInformationVieModel extends BaseViewModel {}

class CheckoutContactInformationWidget extends StatelessWidget {
  const CheckoutContactInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final contactController = Get.find<ContactInformationController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactInformationPage(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              final user = contactController.user.value;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (user == null ||
                                      (user.name.isEmpty &&
                                          user.surname.isEmpty &&
                                          user.number.isEmpty &&
                                          user.email.isEmpty))
                                    Text('Enter Your data here')
                                  else ...[
                                    Text(
                                      '${user.name} ${user.surname}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(user.number),
                                    SizedBox(height: 2),
                                    Text(user.email),
                                  ],
                                ],
                              );
                            }),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.flip(
                                flipX: true,
                                child: AppIcons.backIcon(color: AppColors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
