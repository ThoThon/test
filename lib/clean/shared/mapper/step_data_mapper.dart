import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/data/model/step_data.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/entity/step.dart';

class StepDataMapper extends BaseDataMapper<StepData, Step> {
  @override
  Step mapToEntity(StepData? data) {
    return Step(
      resultDate: data?.ngayKetQua ?? '',
      resultCode: data?.maKetQua ?? '',
      resultDescription: data?.moTaKetQua ?? '',
      isFail: data?.isFail,
    );
  }
}
