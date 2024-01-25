import 'package:apphud/apphud.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path_helper;
import 'package:path_provider/path_provider.dart';
import 'package:smart_budget_companion_113/model/smart_budget_model.dart';
import 'package:smart_budget_companion_113/screen/splash/splash_screen.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/urls.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Apphud.start(apiKey: DocFFSmartBudget.apphudApiKey);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Hive.registerAdapter(SpendingModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart budget',
        home: child,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColorsSmartBudget.color2C2F42,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColorsSmartBudget.color2C2F42,
          ),
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
      ),
      child: const SplashScreen(),
    );
  }
}

extension HiveExtension on HiveInterface {
  Future<void> initFlutter([String? subDir]) async {
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) return;
    var appDir = await getApplicationDocumentsDirectory();
    init(path_helper.join(appDir.path, subDir));
  }
}
