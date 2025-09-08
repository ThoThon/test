import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';

import '../../../../shared/entity/categories_630/categories_630_src.dart';

class Get630CategoriesUseCase extends NoInputUseCase<Categories630> {
  final LoginRepository _loginRepository;

  Get630CategoriesUseCase(this._loginRepository);

  @override
  Future<Categories630> execute() {
    return _loginRepository.get630Categories();
  }
}
