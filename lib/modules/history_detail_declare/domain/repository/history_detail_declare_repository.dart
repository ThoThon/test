import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/entity/declare_history_lookup_result.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/entity/file_number.dart';

abstract class HistoryDetailDeclareRepository extends BaseRepositoryCl {
  Future<FileNumber> getFileNumber({
    required String key,
  });

  Future<DeclareHistoryLookupResult> lookupProcessHistory({
    required String soHoSo,
  });
}
