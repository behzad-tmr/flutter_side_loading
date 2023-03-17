import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/application/data_provider.dart';
import 'package:flutter_riverpod_base/base/base_view_model.dart';
import 'package:flutter_riverpod_base/utils/app_constant/strings.dart';
import 'package:flutter_riverpod_base/utils/custom_message.dart';

class VerifyViewModel extends BaseViewModel {
  Future<void> verifyPhoneNumber(
      WidgetRef ref, BuildContext context, String phoneNumber,String otpCode) async {
    setIsLoading();
    Map<String, String> param = <String, String>{};
    param['mobile'] = phoneNumber;
    param['code'] = otpCode;
    final response =
        await ref.watch(apiClientProvider).userVerify(param, context);
    if (response.isSuccess) {
      final perf = ref.read(appPreferenceHelperProvider);
      await perf.setAccessToken(response.data!.token);
      await perf.setUserLoggedInMode(1);
      await perf.setUserID(response.data!.user!.id.toString());
      await perf.setUserMobileNumber(phoneNumber);
      Navigator.pushNamed(context, '/mainPage');
    } else {
      showMessage(
        response.errorResponseModel != null
            ? response.errorResponseModel!.nonFieldErrors![0]
            : Strings.unknownError,
        context,
        true,
      );
    }

    cancelIsLoading();
  }
}

final verifyViewModelProvider = ChangeNotifierProvider<VerifyViewModel>(
  (ref) => VerifyViewModel(),
);
