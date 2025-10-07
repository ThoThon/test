import '../../../../clean/core/domain/entity/entity.dart';

class Step implements Entity {
  final String resultDate;
  final String resultCode;
  final String resultDescription;
  final bool? isFail;

  Step({
    required this.resultDate,
    required this.resultCode,
    required this.resultDescription,
    this.isFail,
  });

  bool get isSuccessStep => !(isFail ?? true);
}
