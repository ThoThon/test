// Do response từ API /api/Document/get-kykekhai không theo chuẩn "result": [] nên phải tạo class này
import 'declaration_period_data.dart';

class DeclarationPeriodListData {
  final List<DeclarationPeriodData> periods;

  const DeclarationPeriodListData({
    required this.periods,
  });

  factory DeclarationPeriodListData.fromJson(Map<String, dynamic> json) {
    return DeclarationPeriodListData(
      periods: json['kyKeKhais'] != null
          ? (json['kyKeKhais'] as List<dynamic>)
              .map((e) => DeclarationPeriodData.fromJson(e))
              .toList()
          : [],
    );
  }
}
