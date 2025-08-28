import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class SocialAgency implements Entity {
  final String maCoQuanBHXH;
  final String tenCoQuanBHXH;
  final String maTinh;
  final String tenTinhThanhPho;

  const SocialAgency({
    required this.maCoQuanBHXH,
    required this.tenCoQuanBHXH,
    required this.maTinh,
    required this.tenTinhThanhPho,
  });
}
