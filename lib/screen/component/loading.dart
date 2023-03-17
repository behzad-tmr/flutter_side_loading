import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Lottie.asset(
      'assets/animations/6bgdark.json',
      width: 25,
      height: 25,
    ),);
  }
}
