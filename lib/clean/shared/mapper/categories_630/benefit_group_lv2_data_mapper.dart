import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/model/categories_630/categories_630_src.dart';

class BenefitGroupLv2DataMapper
    extends BaseDataMapper<BenefitGroupLv2Data, BenefitGroupLv2> {
  @override
  BenefitGroupLv2 mapToEntity(BenefitGroupLv2Data? data) {
    return BenefitGroupLv2(
      maNhomHuong: data?.maNhomHuong ?? '',
      maNhomHuongC2: data?.maNhomHuongC2 ?? '',
      tenNhomHuongC2: data?.tenNhomHuongC2 ?? '',
    );
  }
}
