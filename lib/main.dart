import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/screen/splash_screen/splash_screen_page.dart';
import 'package:flutter_riverpod_base/theme.dart';
import 'package:flutter_riverpod_base/utils/app_constant/rout.dart';
import 'package:flutter_riverpod_base/utils/app_constant/strings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child :MyApp() ) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const SplashScreenPage(),
      initialRoute: '/',
      routes: AppRout.routes,
    );
  }
}
