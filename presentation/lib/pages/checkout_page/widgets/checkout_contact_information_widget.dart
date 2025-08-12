
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/contact_information_page/contact_information_page.dart';
import 'package:presentation/view/base_view_model.dart';

class CheckoutContactInformationVieModel extends BaseViewModel{}

class CheckoutContactInformationWidget extends StatelessWidget {
  const CheckoutContactInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('this is');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactInformationPage()),
              );
            },
            child: ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactInformationPage()),
              );

            }, child: Text(
              'dasda',
            )),
          ),
        ],
      ),
    );
  }
}
