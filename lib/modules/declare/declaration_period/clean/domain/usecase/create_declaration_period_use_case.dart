import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/repository/declaration_period_repository.dart';

class CreateDeclarationPeriodUseCase
    extends UseCase<CreateDeclarationPeriodUseCaseInput, DeclarationPeriod> {
  final DeclarationPeriodRepository _declarationPeriodRepository;

  CreateDeclarationPeriodUseCase(this._declarationPeriodRepository);

  @override
  Future<DeclarationPeriod> execute(
    CreateDeclarationPeriodUseCaseInput input,
  ) {
    return _declarationPeriodRepository.createDeclarationPeriod(
      year: input.year,
      month: input.month,
      procedureId: input.procedureId,
    );
  }
}

class CreateDeclarationPeriodUseCaseInput {
  final int year;
  final int month;
  final int procedureId;

  CreateDeclarationPeriodUseCaseInput({
    required this.year,
    required this.month,
    required this.procedureId,
  });
}
