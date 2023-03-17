import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/utils/app_constant/colors.dart';

import 'component/splash_screen_body.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = (WidgetsBinding.instance.window.platformBrightness==Brightness.light);
    return  SafeArea(
        child: Scaffold(
          backgroundColor: isLightTheme ? blue : metallicBlue,
      body: SplashScreenBody(),
    ));
  }
}
