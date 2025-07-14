import 'dart:typed_data';

import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';

class ViewPdfRepository extends BaseRepository {
  ViewPdfRepository(super.controller);

  Future<Uint8List> downloadPdf(String url) async {
    final response = await baseCallApi(
      '',
      urlOther: url,
      EnumRequestMethod.get,
      isDownload: true,
    );
    return response;
  }
}
