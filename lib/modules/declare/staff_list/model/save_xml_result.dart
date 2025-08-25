import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';

class SaveXmlResult {
  final bool hasD01;
  final bool hasD02;
  final bool hasOdM01hsb;
  final bool hasTsM01hsb;
  final bool hasDsM01hsb;
  final List<Tk1PreviewPath>? tk1s;
  final String? attachPreviewPath;

  const SaveXmlResult({
    required this.hasD01,
    required this.hasD02,
    required this.hasOdM01hsb,
    required this.hasTsM01hsb,
    required this.hasDsM01hsb,
    this.tk1s,
    this.attachPreviewPath,
  });

  factory SaveXmlResult.fromJson(Map<String, dynamic> json) {
    return SaveXmlResult(
      hasD01: json['hasD01'] ?? false,
      hasD02: json['hasD02'] ?? false,
      hasOdM01hsb: json['hasOdM01hsb'] ?? false,
      hasTsM01hsb: json['hasTsM01hsb'] ?? false,
      hasDsM01hsb: json['hasDsM01hsb'] ?? false,
      tk1s: (json['tK1s'] as List<dynamic>?)
          ?.map((e) => Tk1PreviewPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachPreviewPath: json['attachPreviewPath'],
    );
  }
}
