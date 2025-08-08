import 'package:v_bhxh/clean/shared/entity/ward.dart';
import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/repository/ward_repository.dart';

class GetWardsUseCase extends UseCase<GetWardsUseCaseInput, List<Ward>> {
  final WardRepository _wardRepository;

  GetWardsUseCase(this._wardRepository);

  @override
  Future<List<Ward>> execute(GetWardsUseCaseInput input) {
    return _wardRepository.getWards(
      provinceCode: input.provinceCode,
      districtCode: input.districtCode,
    );
  }
}

class GetWardsUseCaseInput {
  final String provinceCode;
  final String districtCode;

  GetWardsUseCaseInput({
    required this.provinceCode,
    required this.districtCode,
  });
}
