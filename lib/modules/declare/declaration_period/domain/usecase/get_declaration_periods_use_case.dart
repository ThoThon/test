import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/repository/declaration_period_repository.dart';

/// Lấy danh sách kỳ kê khai
class GetDeclarationPeriodsUseCase extends UseCase<
    GetDeclarationPeriodsUseCaseInput, List<DeclarationPeriod>> {
  final DeclarationPeriodRepository _declarationPeriodRepository;

  GetDeclarationPeriodsUseCase(this._declarationPeriodRepository);

  @override
  Future<List<DeclarationPeriod>> execute(
    GetDeclarationPeriodsUseCaseInput input,
  ) {
    return _declarationPeriodRepository.getDeclarationPeriods(
      year: input.year,
      month: input.month,
      periodId: input.periodId,
      status: input.status,
    );
  }
}

class GetDeclarationPeriodsUseCaseInput {
  final int year;
  final int month;
  final int periodId;
  final int? status;

  GetDeclarationPeriodsUseCaseInput({
    required this.year,
    required this.month,
    required this.periodId,
    this.status,
  });
}
