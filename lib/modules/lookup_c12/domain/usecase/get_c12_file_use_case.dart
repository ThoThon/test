
import '../../../../clean/core/domain/usecase/base_use_case.dart';
import '../entity/lookup_c12.dart';
import '../repository/lookup_c12_repository.dart';

class GetC12FileUseCase extends UseCase<int, List<LookupC12>> {
  final LookupC12Repository _lookupC12Repository;

  GetC12FileUseCase(this._lookupC12Repository);

  @override
  Future<List<LookupC12>> execute(int input) {
    return _lookupC12Repository.getC12File(year: input);
  }
}
