import 'package:flutter/cupertino.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';

import '../../../util/widgets/text_field_widget.dart';
import '../../../view/base_view_model.dart';
import 'delivery_type_widget.dart';

class DeliveryItemBuildWidget {
  final Widget widget;
  final String key;

  DeliveryItemBuildWidget({required this.widget, required this.key});
}

DeliveryItemBuildWidget buildItemWidget(BaseViewModel item, [int? index]) {
   final Widget widget;
   final String keyValue;

  if (item is DeliveryTypeViewModel) {
    widget = DeliveryTypeWidget(itemViewModel: item);
    keyValue = 'delivery_type';
  } else if (item is SelectionViewModel) {
    widget = SelectionWidget(itemViewModel: item);
    keyValue = 'selection_${item.keyId}_${item.title}';
  } else if (item is TextFieldViewModel) {
    widget = TextFieldWidget(itemViewModel: item);
    keyValue = 'text_field_${item.keyId}';
  } else {
    widget = const SizedBox.shrink();
    keyValue = 'unknown_${index ?? 'x'}';
  }

  return DeliveryItemBuildWidget(widget: widget, key: keyValue);
}
