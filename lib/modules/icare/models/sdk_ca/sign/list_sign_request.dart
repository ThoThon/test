import '../../../../../core/values/values.src.dart';
import '../../../icare.src.dart';

class ListSignRequestIcare extends BaseModelSDK {
  const ListSignRequestIcare({
    this.pageSize = AppConst.defaultPageSize,
    this.pageNumber = AppConst.defaultPageNumber,
  });

  final int pageSize;

  final int pageNumber;

  @override
  Map<String, dynamic> toJson() {
    return {
      'page_size': pageSize,
      'page_number': pageNumber,
    };
  }
}
