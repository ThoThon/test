import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';

class SaveXmlResult {
  final String? d02PreviewPath;
  final List<Tk1PreviewPath>? tk1PreviewPaths;
  final String? d01PreviewPath;

  const SaveXmlResult({
    this.d02PreviewPath,
    this.tk1PreviewPaths,
    this.d01PreviewPath,
  });

  factory SaveXmlResult.fromJson(Map<String, dynamic> json) {
    return SaveXmlResult(
      d02PreviewPath: json['d02PreviewPath'],
      tk1PreviewPaths: (json['tk1PreviewPaths'] as List<dynamic>?)
          ?.map((e) => Tk1PreviewPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      d01PreviewPath: json['d01PreviewPath'],
    );
  }
}
