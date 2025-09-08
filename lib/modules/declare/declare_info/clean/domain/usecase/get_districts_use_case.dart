import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/repository/district_repository.dart';

class GetDistrictsUseCase extends UseCase<String, List<District>> {
  final DistrictRepository _districtRepository;

  GetDistrictsUseCase(this._districtRepository);

  @override
  Future<List<District>> execute(String input) {
    return _districtRepository.getDistricts(provinceCode: input);
  }
}
