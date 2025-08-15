import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:v_bhxh/modules/src.dart';

Future<void> initFirebase({required FirebaseOptions firebaseOptions}) async {
  // Cần try-catch ở đây, để tránh trường hợp Firebase.initializeApp lỗi dẫn tới chết app
  // Lỗi có thể là [core/duplicate-app] A Firebase App named "[DEFAULT]" already exists
  // hoặc cũng có thể do điện thoại không hỗ trợ firebase chẳng hạn...
  try {
    // Init Firebase
    await Firebase.initializeApp(options: firebaseOptions);

    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (e) {
    logger.e('Error initializing Firebase: $e');
  }
}
