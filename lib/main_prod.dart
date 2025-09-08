import 'package:flutter/material.dart';
import 'package:v_bhxh/clean/core/presentation/app.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/app_binding.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/firebase_init.dart';
import 'package:v_bhxh/firebase_options_prod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  await AppBinding().bind(env: AppEnv.prod);
  runApp(App());
}
