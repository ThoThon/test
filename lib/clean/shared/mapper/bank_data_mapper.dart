import 'package:v_bhxh/clean/shared/entity/categories_630/bank.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';
import 'package:v_bhxh/clean/shared/model/categories_630/bank_data.dart';

class BankDataMapper extends BaseDataMapper<BankData, Bank> {
  @override
  Bank mapToEntity(BankData? data) {
    return Bank(
      id: data?.id ?? 0,
      provinceCoe: data?.provinceCoe ?? '',
      code: data?.code ?? '',
      name: data?.name ?? '',
    );
  }
}
