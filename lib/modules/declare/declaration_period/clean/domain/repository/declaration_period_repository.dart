import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/entity_src.dart';

abstract class DeclarationPeriodRepository extends BaseRepositoryCl {
  Future<List<DeclarationPeriod>> getDeclarationPeriods({
    required int periodId,
    required int month,
    required int year,
  });

  // Future<DeclarationPeriod> createDeclarationPeriod({
  //   required CreateDeclarationPeriodRequest request,
  // });

  /// Xóa kỳ kê khai
  Future<bool> deleteDeclarationPeriod({
    required String id,
  });
}
