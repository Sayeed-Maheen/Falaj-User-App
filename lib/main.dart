import 'package:falaj_user_app/screens/splashScreen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'constant/app_constant.dart';
import 'constant/dep.dart' as dep;
import 'constant/messages.dart';
import 'controllers/language_controller.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await dep.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(
    languages: _languages,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                colorScheme:
                    ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
                useMaterial3: true,
                fontFamily: "Manrope"),
            locale: localizationController.locale,
            translations: Messages(languages: widget.languages),
            fallbackLocale: Locale(
              AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode,
            ),
            home: const SplashScreen(),
          );
        });
      },
    );
  }
}
