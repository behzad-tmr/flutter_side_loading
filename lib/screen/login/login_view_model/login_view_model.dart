import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/application/data_provider.dart';
import 'package:flutter_riverpod_base/base/base_view_model.dart';
import 'package:flutter_riverpod_base/screen/verify/verify_page.dart';
import 'package:flutter_riverpod_base/utils/app_constant/strings.dart';
import 'package:flutter_riverpod_base/utils/custom_message.dart';

class LoginViewModel extends BaseViewModel {

  Future<void> sendPhoneNumber(WidgetRef ref, BuildContext context,
      String phoneNumber) async {
    setIsLoading();
    Map<String, String> param = <String, String>{};
    param['mobile'] = phoneNumber;
    final response = await ref.watch(apiClientProvider).mobileLogin(
        param, context);
    if (response.isSuccess) {
      Navigator.pushNamed(context, '/verifyMobileNumber',arguments: VerifyArguments(phoneNumber));
    } else {
      showMessage(
        response.errorResponseModel != null ? response.errorResponseModel!
            .nonFieldErrors![0] : Strings.unknownError, context, true,);
    }

    cancelIsLoading();
  }
}

final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>(
      (ref) => LoginViewModel(),
);
