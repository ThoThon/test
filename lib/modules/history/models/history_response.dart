import '../../src.dart';

class HistoryResponse {
  final List<HistoryItemModel> historyResults;
  final int totalCount;

  HistoryResponse({
    required this.historyResults,
    required this.totalCount,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) {
    return HistoryResponse(
      historyResults: (json['historyResults'] as List)
          .map((e) => HistoryItemModel.fromJson(e))
          .toList(),
      totalCount: json['totalCount'] ?? 0,
    );
  }
}
