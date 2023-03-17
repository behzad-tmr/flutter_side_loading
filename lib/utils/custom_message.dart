import 'package:flutter/material.dart';

import 'app_constant/colors.dart';

void showMessage(String message, BuildContext context, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: greyDark,
      content: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            message,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isError ? red : Colors.white),
          ))));
}
