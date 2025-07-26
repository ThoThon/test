import 'package:v_bhxh/clean/core/domain/entity/d02_categories_cl.dart';
import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';

class GetD02CategoriesUseCase extends NoInputUseCase<D02CategoriesCl> {
  final LoginRepository _loginRepository;

  GetD02CategoriesUseCase(this._loginRepository);

  @override
  Future<D02CategoriesCl> execute() {
    return _loginRepository.getD02Categories();
  }
}
