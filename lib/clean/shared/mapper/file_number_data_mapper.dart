import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history_detail_declare/data/model/file_number_data.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/entity/file_number.dart';

class FileNumberDataMapper extends BaseDataMapper<FileNumberData, FileNumber> {
  @override
  FileNumber mapToEntity(FileNumberData? data) {
    return FileNumber(
      code: data?.rHCode ?? '',
      status: data?.rHStatus ?? '',
      timeReceived: data?.rHTimeBHXH ?? '',
      recordNumber: data?.rHRecordNumber ?? '',
    );
  }
}
