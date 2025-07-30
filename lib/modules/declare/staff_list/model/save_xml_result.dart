import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';

class SaveXmlResult {
  final bool hasD01;
  final bool hasD02;
  final bool hasOdM01hsb;
  final List<Tk1PreviewPath>? tk1s;
  final String? attachPreviewPath;

  const SaveXmlResult({
    required this.hasOdM01hsb,
    required this.hasD01,
    required this.hasD02,
    this.tk1s,
    this.attachPreviewPath,
  });

  factory SaveXmlResult.fromJson(Map<String, dynamic> json) {
    return SaveXmlResult(
      hasOdM01hsb: json['hasOdM01hsb'] ?? false,
      hasD01: json['hasD01'] ?? false,
      hasD02: json['hasD02'] ?? false,
      tk1s: (json['tK1s'] as List<dynamic>?)
          ?.map((e) => Tk1PreviewPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachPreviewPath: json['attachPreviewPath'],
    );
  }
}
