import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630c/domain/entity/declare_info_630c.dart';

import '../repository/declare_info_630c_repository.dart';

class UpdateProcedure630cUseCase extends UseCase<DeclareInfo630c, bool> {
  final DeclareInfo630cRepository _declareInfo630cRepository;

  UpdateProcedure630cUseCase(this._declareInfo630cRepository);

  @override
  Future<bool> execute(DeclareInfo630c input) {
    return _declareInfo630cRepository.update630c(request: input);
  }
}
