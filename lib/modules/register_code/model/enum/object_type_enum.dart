import 'package:get/get.dart';

enum ObjectTypeEnum {
  // Cá nhân
  individual('Cá nhân'),

  // Tổ chức
  organization("Tổ chức");

  final String text;

  const ObjectTypeEnum(this.text);
}

// ObjectTypeEnum? getObjectType(String? objectType) {
//   return ObjectTypeEnum.values.firstWhereOrNull(
//     (e) => e.text.tr == objectType,
//   );
// }
