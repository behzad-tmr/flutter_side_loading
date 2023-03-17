import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/screen/verify/component/verify_body.dart';

class VerifyArguments {
  final String mobileNumber;
  VerifyArguments(this.mobileNumber);
}


class VerifyPage extends ConsumerWidget {
  const VerifyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as VerifyArguments;
    return SafeArea(
        child: Scaffold(
      body: VerifyBody(mobileNumber: args.mobileNumber,),
    ));
  }
}
