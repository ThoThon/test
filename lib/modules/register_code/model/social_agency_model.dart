import 'package:equatable/equatable.dart';

class SocialAgencyModel extends Equatable {
  final String maCoQuanBHXH;
  final String tenCoQuanBHXH;
  final String maTinh;
  final String tenTinhThanhPho;

  const SocialAgencyModel({
    required this.maCoQuanBHXH,
    required this.tenCoQuanBHXH,
    required this.maTinh,
    required this.tenTinhThanhPho,
  });

  factory SocialAgencyModel.fromJson(Map<String, dynamic> json) {
    return SocialAgencyModel(
      maCoQuanBHXH: json['maCoQuanBHXH'] ?? '',
      tenCoQuanBHXH: json['tenCoQuanBHXH'] ?? '',
      maTinh: json['maTinh'] ?? '',
      tenTinhThanhPho: json['tenTinhThanhPho'] ?? '',
    );
  }

  @override
  List<Object?> get props =>
      [maCoQuanBHXH, tenCoQuanBHXH, tenTinhThanhPho, maTinh];
}
