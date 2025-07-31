import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/repository/declaration_period_repository.dart';

class DeleteDeclarationPeriodUseCase extends UseCase<String, bool> {
  final DeclarationPeriodRepository _declarationPeriodRepository;

  DeleteDeclarationPeriodUseCase(this._declarationPeriodRepository);

  @override
  Future<bool> execute(String input) {
    return _declarationPeriodRepository.deleteDeclarationPeriod(id: input);
  }
}
