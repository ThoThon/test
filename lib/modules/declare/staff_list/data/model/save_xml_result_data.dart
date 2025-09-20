import 'tk1_preview_path_data.dart';

class SaveXmlResultData {
  final bool? hasD01;
  final bool? hasD02;
  final bool? hasOdM01hsb;
  final bool? hasTsM01hsb;
  final bool? hasDsM01hsb;
  final List<Tk1PreviewPathData>? tk1s;
  final String? attachPreviewPath;

  const SaveXmlResultData({
    this.hasD01,
    this.hasD02,
    this.hasOdM01hsb,
    this.hasTsM01hsb,
    this.hasDsM01hsb,
    this.tk1s,
    this.attachPreviewPath,
  });

  factory SaveXmlResultData.fromJson(Map<String, dynamic> json) {
    return SaveXmlResultData(
      hasD01: json['hasD01'],
      hasD02: json['hasD02'],
      hasOdM01hsb: json['hasOdM01hsb'],
      hasTsM01hsb: json['hasTsM01hsb'],
      hasDsM01hsb: json['hasDsM01hsb'],
      tk1s: (json['tK1s'] as List<dynamic>?)
          ?.map((e) => Tk1PreviewPathData.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachPreviewPath: json['attachPreviewPath'],
    );
  }
}
