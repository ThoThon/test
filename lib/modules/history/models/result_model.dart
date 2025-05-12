import 'package:v_bhxh/modules/src.dart';

class ResultModel {
  final List<HistoryResults> historyResults;
  final int totalCount;

  ResultModel({
    required this.historyResults,
    required this.totalCount,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      historyResults: List<HistoryResults>.from(
        json['historyResults'].map(
          (item) => HistoryResults.fromJson(item),
        ),
      ),
      totalCount: json['totalCount'],
    );
  }
}
