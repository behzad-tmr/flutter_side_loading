import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod_base/utils/app_constant/colors.dart';

import 'loading.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    this.leftIconPath,
    required this.onClick,
    this.isLoading = false,
    this.height = 56,
    this.width = double.infinity,
    this.borderRadius,
    this.rightIconPath,
    this.rightIconSize,
    this.fontSize,
  }) : super(key: key);
  final String text;
  final String? leftIconPath;
  final String? rightIconPath;
  final VoidCallback onClick;
  final bool isLoading;
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final double? rightIconSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: borderRadius ?? BorderRadius.circular(30),
        ),
        child: !isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leftIconPath != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        leftIconPath!,
                        color: Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(),
                    child: Text(
                      text,
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize ?? 16,
                          color: Colors.white),
                    ),
                  ),
                  if (rightIconPath != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SvgPicture.asset(
                        rightIconPath!,
                        color: Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ),
                ],
              )
            : const Center(
                child: LoadingWidget(),
              ),
      ),
    );
  }
}
