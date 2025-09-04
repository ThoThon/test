import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

class GetD02CategoriesUseCase extends NoInputUseCase<D02Categories> {
  final LoginRepository _loginRepository;

  GetD02CategoriesUseCase(this._loginRepository);

  @override
  Future<D02Categories> execute() {
    return _loginRepository.getD02Categories();
  }
}
