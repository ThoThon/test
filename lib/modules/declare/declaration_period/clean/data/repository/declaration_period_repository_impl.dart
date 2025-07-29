import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/declaration_period.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/repository/declaration_period_repository.dart';

class DeclarationPeriodRepositoryImpl extends DeclarationPeriodRepository {
  @override
  Future<DeclarationPeriod> getDeclarationPeriods({
    required int periodId,
    required int month,
    required int year,
  }) {
    // TODO: implement getDeclarationPeriods
    throw UnimplementedError();
  }
}
