import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod_base/screen/login/login_page.dart';
import 'package:flutter_riverpod_base/screen/main/main_page.dart';
import 'package:flutter_riverpod_base/screen/verify/verify_page.dart';

class AppRout{
  static final  Map<String, WidgetBuilder> routes= {
    '/login': (context) => const LoginPage(),
    '/verifyMobileNumber': (context) => const VerifyPage(),
    '/mainPage': (context) => const MainPage(),
  };
}