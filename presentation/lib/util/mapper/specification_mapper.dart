import 'package:domain/modules/specifications/specification_entity.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:presentation/view/specification_view_model.dart';

extension SpecificationViewModelMapper on SpecificationEntity{
  SpecificationViewModel get toModel{
    return SpecificationViewModel(title: title, value: value);
  }
}