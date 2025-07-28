import 'package:domain/modules/specifications/specification_entity.dart';
import 'package:presentation/view/product_view_model.dart';

extension SpecificationViewModelMapper on SpecificationEntity{
  Specification get toModel{
    return Specification(title: title, value: value);
  }
}