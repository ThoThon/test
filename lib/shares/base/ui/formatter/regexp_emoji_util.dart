import 'package:flutter/services.dart';

class RegexpEmojiUtil {
  static final emojiDenyFormatter = FilteringTextInputFormatter.deny(
    RegExp(
      r'[\u{1F600}-\u{1F64F}' 
      r'\u{1F300}-\u{1F5FF}'
      r'\u{1F680}-\u{1F6FF}' 
      r'\u{1F700}-\u{1F77F}' 
      r'\u{1F780}-\u{1F7FF}'
      r'\u{1F800}-\u{1F8FF}' 
      r'\u{1F900}-\u{1F9FF}'
      r'\u{1FA00}-\u{1FA6F}' 
      r'\u{1FA70}-\u{1FAFF}' 
      r'\u{2600}-\u{26FF}'
      r'\u{2700}-\u{27BF}'
      r'\u{FE00}-\u{FE0F}' 
      r'\u{1F1E0}-\u{1F1FF}]+', 
      unicode: true,
    ),
  );
}
