import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/entity/register_code_categories.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/repository/register_code_repository.dart';

class GetCategoriesUseCase extends NoInputUseCase<RegisterCodeCategories> {
  final RegisterCodeRepository _registerCodeRepository;

  GetCategoriesUseCase(this._registerCodeRepository);

  @override
  Future<RegisterCodeCategories> execute() {
    return _registerCodeRepository.getCategories();
  }
}
