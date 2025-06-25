import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:v_bhxh/firebase_options.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import 'core/core.src.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _Application();
}

class _Application extends State<Application> {
  final botToastBuilder = BotToastInit();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyBoard.hide,
      child: GetMaterialApp(
        locale: const Locale('vi', 'VN'),
        debugShowCheckedModeBanner: false,
        translationsKeys: AppTranslation.translations,
        initialRoute: AppRoutes.splash.path,
        getPages: RouteAppPage.route,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColorLight,
          appBarTheme: const AppBarTheme(
            color: AppColors.backgroundColorLight,
          ),
        ),
        builder: (context, child) {
          Widget toastChild = ScrollConfiguration(
            behavior: MyBehavior(),
            child: MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child ?? Container(),
            ),
          );
          return botToastBuilder(context, toastChild);
        },
        navigatorObservers: [BotToastNavigatorObserver()],

        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('vi', ''),
          // Locale('en', ''),
        ],
        // title: AppStr.appName,
        // theme: getThemeByAppTheme(false)
        //     .copyWith(unselectedWidgetColor: AppColors.colorMain),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
