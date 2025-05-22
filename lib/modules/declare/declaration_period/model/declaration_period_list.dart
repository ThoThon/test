import 'declaration_period.dart';

// Do response từ API /api/Document/get-kykekhai không theo chuẩn "result": [] nên phải tạo class này
class DeclarationPeriodList {
  final List<DeclarationPeriod> periods;

  const DeclarationPeriodList({
    required this.periods,
  });

  factory DeclarationPeriodList.fromJson(Map<String, dynamic> json) {
    return DeclarationPeriodList(
      periods: json['kyKeKhais'] != null
          ? (json['kyKeKhais'] as List<dynamic>)
              .map((e) => DeclarationPeriod.fromJson(e))
              .toList()
          : [],
    );
  }
}
