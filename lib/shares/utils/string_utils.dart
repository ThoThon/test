extension StringExt on String {
  bool get isEmailValid {
    final emailRegex = RegExp(r'^[\w\-.+%]+@(?:[\w-]+\.)+[\w]{2,6}$');
    return emailRegex.hasMatch(this);
  }
}
