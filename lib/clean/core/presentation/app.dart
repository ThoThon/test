import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/app_controller.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/routes/app_pages.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

class App extends BaseGetPage<AppController> {
  App({super.key});

  final botToastBuilder = BotToastInit();

  @override
  final isAppWidget = true;

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: KeyBoard.hide,
      child: GetMaterialApp(
        title: 'vBHXH',
        locale: const Locale('vi', 'VN'),
        translationsKeys: AppTranslation.translations,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesCl.login.path,
        getPages: AppPages.pages,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('vi', 'VN'),
          // Locale('en', 'US'),
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColorLight,
          appBarTheme: const AppBarTheme(
            color: AppColors.backgroundColorLight,
          ),
        ),
        builder: (context, child) {
          return botToastBuilder(context, child);
        },
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
