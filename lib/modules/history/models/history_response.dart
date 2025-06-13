class HistoryResponse<T> {
  final List<T> historyResults;
  final int totalCount;

  HistoryResponse({
    required this.historyResults,
    required this.totalCount,
  });

  factory HistoryResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return HistoryResponse(
      historyResults: (json['historyResults'] as List<dynamic>)
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int,
    );
  }
}
