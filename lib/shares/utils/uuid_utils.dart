import 'package:uuid/uuid.dart';

const uuid = Uuid();

String generateUuid() {
  return uuid.v4();
}
