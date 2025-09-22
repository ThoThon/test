import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/repository/declare_info_630a_repository.dart';

import '../entity/declare_info_630a.dart';

class AddProcedure630aUseCase extends UseCase<DeclareInfo630a, bool> {
  final DeclareInfo630aRepository _declareInfo630aRepository;
  AddProcedure630aUseCase(this._declareInfo630aRepository);

  @override
  Future<bool> execute(DeclareInfo630a input) {
    return _declareInfo630aRepository.addProcedure630a(request: input);
  }
}
