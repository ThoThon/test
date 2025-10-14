import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630c/domain/entity/declare_info_630c.dart';

import '../repository/declare_info_630c_repository.dart';

class GetDetailProcedure630cUseCase extends UseCase<String, DeclareInfo630c> {
  final DeclareInfo630cRepository _declareInfo630cRepository;

  GetDetailProcedure630cUseCase(this._declareInfo630cRepository);

  @override
  Future<DeclareInfo630c> execute(String input) {
    return _declareInfo630cRepository.getDetail630c(id: input);
  }
}
