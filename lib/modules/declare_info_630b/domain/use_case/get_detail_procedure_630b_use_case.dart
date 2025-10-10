import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630b/declare_info_630b_src.dart';

class GetDetailProcedure630bUseCase extends UseCase<String, DeclareInfo630b> {
  final DeclareInfo630bRepository _declareInfo630bRepository;

  GetDetailProcedure630bUseCase(this._declareInfo630bRepository);

  @override
  Future<DeclareInfo630b> execute(String input) {
    return _declareInfo630bRepository.getDetail630b(id: input);
  }
}
