import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630b/declare_info_630b_src.dart';

class AddProcedure630bUseCase extends UseCase<DeclareInfo630b, bool> {
  final DeclareInfo630bRepository _declareInfo630bRepository;

  AddProcedure630bUseCase(this._declareInfo630bRepository);

  @override
  Future<bool> execute(DeclareInfo630b input) {
    return _declareInfo630bRepository.addProcedure630b(request: input);
  }
}
