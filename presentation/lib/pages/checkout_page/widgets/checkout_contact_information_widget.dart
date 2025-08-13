
import 'package:flutter/material.dart';

import 'package:presentation/pages/contact_information_page/contact_information_page.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/user_view_model.dart';

class CheckoutContactInformationVieModel extends BaseViewModel{}

class CheckoutContactInformationWidget extends StatelessWidget {
final UserViewModel? user;
  const CheckoutContactInformationWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                      MaterialPageRoute(builder: (context) => const ContactInformationPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300) ,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    height: 100,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(user == null ? 'Enter Your data'  : user!.name),
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
