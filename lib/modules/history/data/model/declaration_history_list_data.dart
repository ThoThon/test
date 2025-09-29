import 'declaration_history_item_data.dart';

class DeclarationHistoryListData {
  final List<DeclarationHistoryItemData>? historyResults;
  final int? totalCount;

  DeclarationHistoryListData({
    this.historyResults,
    this.totalCount,
  });

  factory DeclarationHistoryListData.fromJson(Map<String, dynamic> json) {
    return DeclarationHistoryListData(
      historyResults: (json['historyResults'] as List<dynamic>?)
          ?.map((e) =>
              DeclarationHistoryItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'],
    );
  }
}
