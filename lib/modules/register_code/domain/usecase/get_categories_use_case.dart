import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../entity/register_code_categories.dart';
import '../repository/register_code_repository.dart';

class GetCategoriesUseCase extends NoInputUseCase<RegisterCodeCategories> {
  final RegisterCodeRepository _registerCodeRepository;

  GetCategoriesUseCase(this._registerCodeRepository);

  @override
  Future<RegisterCodeCategories> execute() {
    return _registerCodeRepository.getCategories();
  }
}
