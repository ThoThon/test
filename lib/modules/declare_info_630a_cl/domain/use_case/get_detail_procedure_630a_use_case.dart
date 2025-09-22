import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/entity/declare_info_630a.dart';

import '../repository/declare_info_630a_repository.dart';

class GetDetailProcedure630aUseCase extends UseCase<String, DeclareInfo630a> {
  final DeclareInfo630aRepository _declareInfo630aRepository;
  GetDetailProcedure630aUseCase(this._declareInfo630aRepository);

  @override
  Future<DeclareInfo630a> execute(String input) {
    return _declareInfo630aRepository.getDetail630a(id: input);
  }
}
