import 'package:domain/modules/specifications/specification_entity.dart';
import 'package:presentation/view/specification_view_model.dart';

extension SpecificationViewModelMapper on SpecificationEntity {
  SpecificationViewModel get toModel {
    return SpecificationViewModel(id: id, attributeId: attributeId, title: title, value: value);
  }
}

extension SpecificationToEntityMapper on SpecificationViewModel {
  SpecificationEntity get toEntity {
    return SpecificationEntity(id: id, attributeId: attributeId, title: title, value: value);
  }
}
