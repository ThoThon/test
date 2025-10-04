import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list/data/model/get_record_pdf_request_data.dart';
import 'package:v_bhxh/modules/declare/declaration_list/domain/entity/get_record_pdf_request.dart';

class GetRecordPdfRequestDataMapper
    extends BaseEntityMapper<GetRecordPdfRequest, GetRecordPdfRequestData> {
  @override
  GetRecordPdfRequestData mapToData(GetRecordPdfRequest entity) {
    return GetRecordPdfRequestData(
      id: entity.id,
      staffId: entity.staffId,
    );
  }
}
