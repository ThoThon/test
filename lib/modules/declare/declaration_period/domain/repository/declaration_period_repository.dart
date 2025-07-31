import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';

abstract class DeclarationPeriodRepository extends BaseRepositoryCl {
  Future<List<DeclarationPeriod>> getDeclarationPeriods({
    required int periodId,
    required int month,
    required int year,
  });

  Future<DeclarationPeriod> createDeclarationPeriod({
    required int procedureId,
    required int month,
    required int year,
  });

  /// Xóa kỳ kê khai
  Future<bool> deleteDeclarationPeriod({
    required String id,
  });
}
