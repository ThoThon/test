import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'register_history_item.dart';

class RegisterHistoryList implements Entity {
  final List<RegisterHistoryItem> historyResults;
  final int totalCount;

  RegisterHistoryList({
    required this.historyResults,
    required this.totalCount,
  });
}
