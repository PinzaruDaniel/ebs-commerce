
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:presentation/pages/contact_information_page/contact_information_page.dart';
import 'package:presentation/view/base_view_model.dart';

class CheckoutContactInformationVieModel extends BaseViewModel{}

class CheckoutContactInformationWidget extends StatelessWidget {
  const CheckoutContactInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8), // Example padding
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
