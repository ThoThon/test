import 'package:intl/intl.dart';

const String PATTERN_1 = "dd/MM/yyyy";
const String PATTERN_2 = "dd/MM";
const String PATTERN_3 = "yyyy-MM-dd'T'HHmmss";
const String PATTERN_4 = "h:mm a dd/MM";
const String PATTERN_5 = "yyyy-MM-dd HH:mm:ss";
const String PATTERN_6 = "dd/MM/yyyy HH:mm";
const String PATTERN_7 = "HH:mm dd/MM/yyyy";
const String PATTERN_8 = "yyyy-MM-ddTHH:mm:ss";
const String PATTERN_9 = "HH:mm - dd/MM/yyyy";
const String PATTERN_10 = "dd/MM/yyyy HH:mm:ss";
const String PATTERN_11 = "yyyyMMddHHmmss";
const String PATTERN_12 = "MM/yyyy";
const String PATTERN_13 = 'yyyy';
const String PATTERN_DEFAULT = "yyyy-MM-dd";

String formatDateTimeToString(DateTime dateTime) {
  return DateFormat(PATTERN_1).format(dateTime);
}

int convertDMYToTimeStamps(String dateTimeStr, {String pattern = PATTERN_1}) {
  if (dateTimeStr.isNotEmpty) {
    DateTime dateTime = convertStringToDate(dateTimeStr, pattern);
    return dateTime.millisecondsSinceEpoch;
  }
  return 0;
}

String convertDateToString(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}

DateTime convertStringToDate(String dateTime, String pattern) {
  return DateFormat(pattern).parse(dateTime);
}

DateTime? convertStringToDateSafe(String? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  }

  try {
    return convertStringToDate(dateTime, pattern);
  } catch (_) {
    return null;
  }
}

String? convertDateToStringSafe(DateTime? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  }

  try {
    return convertDateToString(dateTime, pattern);
  } catch (_) {
    return null;
  }
}

DateTime? convertDateToDate(DateTime? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  } else {
    return convertStringToDate(convertDateToString(dateTime, pattern), pattern);
  }
}

String convertDateToStringDefault(DateTime dateTime) {
  return DateFormat(PATTERN_DEFAULT).format(dateTime);
}

/// Chuyển đổi chuỗi ngày giờ sang DateTime với định dạng nghiêm ngặt
///
/// Ví du: 31/02/2025 => null
///
/// Nếu dùng `convertDateToStringSafe` thì sẽ trả về 02/03/2025
DateTime? convertDateToStringStrict(String? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  }
  try {
    final format = DateFormat(pattern);
    return format.parseStrict(dateTime);
  } catch (_) {
    return null;
  }
}

String changeDateString(String date, {String pattern = PATTERN_1}) {
  date = date.replaceAll('/', '');
  date = DateFormat(pattern).format(DateTime.parse(date));
  return date;
}

int getQuarter(DateTime date) {
  return (date.month + 2) ~/ 3;
}

String convertTimestampToDate(String timestamp) {
  final DateFormat inputFormat = DateFormat("yyyyMMddHHmmss");
  final DateFormat outputFormat = DateFormat("dd/MM/yyyy");
  final DateTime dateTime = inputFormat.parse(timestamp);
  return outputFormat.format(dateTime);
}

String convertDateFormat(String originalDate) {
  // Tách ngày, tháng và năm từ chuỗi ban đầu
  List<String> dateParts = originalDate.split('/');
  String day = dateParts[0];
  String month = dateParts[1];
  String year = dateParts[2];

  // Kết hợp lại theo định dạng "yyyy-MM-dd"
  String formattedDate = '$year-$month-$day';

  return formattedDate;
}

int calculateDateDifference(String fromDate, String toDate) {
  if (fromDate != "" || toDate != "") {
    // Chuyển đổi chuỗi ngày thành đối tượng DateTime
    DateTime fromDateObj = DateTime.parse(convertDateFormat(fromDate));
    DateTime toDateObj = DateTime.parse(convertDateFormat(toDate));

    // Tính hiệu của hai đối tượng DateTime và lấy giá trị tuyệt đối
    // Duration difference = toDateObj.difference(fromDateObj);

    return (toDateObj.difference(fromDateObj).inHours / 24).round() + 1;
  } else {
    return 1;
  }
}

String convertDateStringToString(String dateString, String pattern) {
  final dateTime = DateTime(
    int.tryParse(dateString.substring(0, 4)) ?? 0, // Năm
    int.tryParse(dateString.substring(4, 6)) ?? 0, // Tháng
    int.tryParse(dateString.substring(6, 8)) ?? 0, // Ngày
    int.tryParse(dateString.substring(8, 10)) ?? 0, // Giờ
    int.tryParse(dateString.substring(10, 12)) ?? 0, // Phút
    int.tryParse(dateString.substring(12, 14)) ?? 0, // Giây
  );
  return convertDateToString(dateTime, pattern);
}
