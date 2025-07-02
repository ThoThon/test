import 'tk01_id_607_result.dart';

class SaveXml607Result {
  final bool hasD01;
  final List<Tk01Id607Result>? tk1s;
  final String? attachPreviewPath;

  const SaveXml607Result({
    required this.hasD01,
    this.tk1s,
    this.attachPreviewPath,
  });

  factory SaveXml607Result.fromJson(Map<String, dynamic> json) {
    return SaveXml607Result(
      hasD01: json['hasD01'] ?? false,
      tk1s: (json['tK1s'] as List<dynamic>?)
          ?.map((e) => Tk01Id607Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachPreviewPath: json['attachPreviewPath'],
    );
  }
}
