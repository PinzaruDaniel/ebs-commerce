import 'package:mock_data/mock_data.dart';

class PromoCodeViewModel{
  List<String> getMockPromoCodes(){
    return[
      'SAVE10',
      'WELCOME5',
      'FREESHIP',
      'DANIELLOH6869',
      mockString(8).toUpperCase(),
    ];
  }
}