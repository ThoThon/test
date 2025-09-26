import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'declaration_history_item.dart';

class DeclarationHistoryList implements Entity {
  final List<DeclarationHistoryItem> historyResults;
  final int totalCount;

  DeclarationHistoryList({
    required this.historyResults,
    required this.totalCount,
  });
}
