import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/utils/app_constant/colors.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black.withOpacity(.7)),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color: Colors.black ,
      ),
      headline2: TextStyle(
        fontSize: 24.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color:  Colors.black ,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color:  Colors.black ,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color:  Colors.black ,
      ),
      headline5: TextStyle(
        fontSize: 13.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 11.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'iran_sans_x',
          fontWeight: FontWeight.w500,
          color: Colors.black),
    ),
    hintColor: Colors.black.withOpacity(.4),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'iran_sans_x',
      ),
        errorStyle: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          fontFamily: 'iran_sans_x',
        ),

          // contentPadding: const EdgeInsets.symmetric(
          //   // vertical: 14,
          //   horizontal: 16,
          // ),
        // filled: true,
        ),
    // colorScheme: ColorScheme.light(
    //     primary: backgroundDark, secondary: secondaryColor, error: errorColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme:
          IconThemeData(color: blue, size: 20),
      unselectedIconTheme:
          IconThemeData(color: Colors.black.withOpacity(.7), size: 20),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
          fontSize: 12.0,
          fontFamily: 'iran_sans_x',
          fontWeight: FontWeight.w600,
          color:blue),
      unselectedLabelStyle: TextStyle(
          fontSize: 12.0,
          fontFamily: 'iran_sans_x',
          fontWeight: FontWeight.w600,
          color:Colors.black.withOpacity(.7)),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: metallicBlue,
    scaffoldBackgroundColor: greyDark,
    cardColor: metallicBlue,
    iconTheme: IconThemeData(color: Colors.white.withOpacity(.7)),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color: Colors.white ,
      ),
      headline2: TextStyle(
        fontSize: 24.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color:  Colors.white ,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color:  Colors.white ,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color:  Colors.white ,
      ),
      headline5: TextStyle(
        fontSize: 13.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontSize: 11.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_x',
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'iran_sans_x',
          fontWeight: FontWeight.w500,
          color: Colors.white),
    ),
    hintColor: Colors.white.withOpacity(.4),
    // inputDecorationTheme: InputDecorationTheme(
    //     errorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(15),
    //         borderSide:
    //             BorderSide(color: errorColor, style: BorderStyle.solid)),
    //     errorStyle: const TextStyle(
    //       fontSize: 12.0,
    //       fontWeight: FontWeight.w400,
    //       fontFamily: 'iran_sans_x',
    //     ),
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(15),
    //         borderSide:
    //             BorderSide(color: primaryColor, style: BorderStyle.solid)),
    //     disabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(15),
    //         borderSide: BorderSide(
    //             color: Colors.black.withOpacity(.2), style: BorderStyle.solid)),
    //     contentPadding: const EdgeInsets.symmetric(
    //       vertical: 14,
    //       horizontal: 27,
    //     ),
    //     fillColor: aliceBlue,
    //     filled: true,
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(24),
    //         borderSide: const BorderSide(color: Colors.transparent, width: 1)),
    //     focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(24),
    //         borderSide: BorderSide(color: backgroundDark, width: 1))),
    // colorScheme: ColorScheme.light(
    //     primary: backgroundDark, secondary: secondaryColor, error: errorColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: greyDark,
      selectedIconTheme:
      IconThemeData(color: blue, size: 20),
      unselectedIconTheme:
      IconThemeData(color: Colors.white.withOpacity(.7), size: 20),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
          fontSize: 12.0,
          fontFamily: 'iran_sans_x',
          fontWeight: FontWeight.w600,
          color:blue),
      unselectedLabelStyle: TextStyle(
          fontSize: 12.0,
          fontFamily: 'iran_sans_x',
          fontWeight: FontWeight.w600,
          color:Colors.white.withOpacity(.7)),
    ),
  );
}

const appBarThemeLight =  AppBarTheme(
    centerTitle: true, elevation: 0, backgroundColor: Colors.white);
final appBarThemeDark = AppBarTheme(
    centerTitle: true, elevation: 0, backgroundColor: metallicBlueDark);
