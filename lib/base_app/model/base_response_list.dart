class BaseResponseList<T> {
  final String code;
  final String? errorMessage;
  final List<T> result;
  final int totalNumber;

  BaseResponseList({
    required this.code,
    this.errorMessage,
    required this.result,
    required this.totalNumber,
  });

  factory BaseResponseList.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromMap) {
    final resultData = json["result"];

    final List<T> parsedResult;
    int total = 0;

    if (resultData is List) {
      parsedResult = List<T>.from(resultData.map((x) => fromMap(x)));
    } else if (resultData is Map<String, dynamic> &&
        resultData.containsKey("data")) {
      parsedResult = List<T>.from(resultData["data"].map((x) => fromMap(x)));
      total = resultData["totalNumber"] ?? 0;
    } else {
      parsedResult = [];
    }

    return BaseResponseList(
      code: json["code"] ?? '',
      errorMessage: json["errorMessage"],
      result: parsedResult,
      totalNumber: total,
    );
  }
}
