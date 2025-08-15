import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:v_bhxh/clean/core/presentation/app.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/app_binding.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/firebase_options_uat.dart' as uat;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: uat.DefaultFirebaseOptions.currentPlatform,
  );
  await AppBinding().bind(env: AppEnv.uat);
  runApp(App());
}
