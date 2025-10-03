import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'tk1_preview_path.dart';

class SaveXmlResultCl implements Entity {
  final bool hasD01;
  final bool hasD02;
  final bool hasOdM01hsb;
  final bool hasTsM01hsb;
  final bool hasDsM01hsb;
  final List<Tk1PreviewPath> tk1s;
  final String? attachPreviewPath;

  const SaveXmlResultCl({
    required this.hasD01,
    required this.hasD02,
    required this.hasOdM01hsb,
    required this.hasTsM01hsb,
    required this.hasDsM01hsb,
    required this.tk1s,
    this.attachPreviewPath,
  });
}
