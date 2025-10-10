import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630b/domain/entity/declare_info_630b.dart';

import '../repository/declare_info_630b_repository.dart';

class UpdateProcedure630bUseCase extends UseCase<DeclareInfo630b, bool> {
  final DeclareInfo630bRepository _declareInfo630bRepository;

  UpdateProcedure630bUseCase(this._declareInfo630bRepository);

  @override
  Future<bool> execute(DeclareInfo630b input) {
    return _declareInfo630bRepository.update630b(request: input);
  }
}
