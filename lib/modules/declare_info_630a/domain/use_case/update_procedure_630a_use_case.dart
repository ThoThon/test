import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630a/domain/entity/declare_info_630a.dart';

import '../repository/declare_info_630a_repository.dart';

class UpdateProcedure630aUseCase extends UseCase<DeclareInfo630a, bool> {
  final DeclareInfo630aRepository _declareInfo630aRepository;
  UpdateProcedure630aUseCase(this._declareInfo630aRepository);

  @override
  Future<bool> execute(DeclareInfo630a input) {
    return _declareInfo630aRepository.update630a(request: input);
  }
}
