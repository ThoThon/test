import 'dart:convert';

abstract class BaseModelSDK {
  const BaseModelSDK();

  Map<String, dynamic> toJson();

  @override
  String toString() => jsonEncode(toJson());
}
