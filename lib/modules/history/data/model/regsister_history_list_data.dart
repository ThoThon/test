import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'register_history_item_data.dart';

class RegisterHistoryListData implements Entity {
  final List<RegisterHistoryItemData>? historyResults;
  final int? totalCount;

  RegisterHistoryListData({
    this.historyResults,
    this.totalCount,
  });

  factory RegisterHistoryListData.fromJson(Map<String, dynamic> json) {
    return RegisterHistoryListData(
      historyResults: (json['historyResults'] as List<dynamic>)
          .map((e) =>
              RegisterHistoryItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'],
    );
  }
}
