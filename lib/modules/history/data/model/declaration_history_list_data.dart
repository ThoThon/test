import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'declaration_history_item_data.dart';

class DeclarationHistoryListData implements Entity {
  final List<DeclarationHistoryItemData>? historyResults;
  final int? totalCount;

  DeclarationHistoryListData({
    this.historyResults,
    this.totalCount,
  });

  factory DeclarationHistoryListData.fromJson(Map<String, dynamic> json) {
    return DeclarationHistoryListData(
      historyResults: (json['historyResults'] as List<dynamic>)
          .map((e) =>
              DeclarationHistoryItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'],
    );
  }
}
