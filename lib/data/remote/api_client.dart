
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/data/local/app_prefrence.dart';
import 'package:flutter_riverpod_base/data/model/responseModel/base_response_model.dart';
import 'package:flutter_riverpod_base/data/model/responseModel/check_update_rm.dart';
import 'package:flutter_riverpod_base/data/model/responseModel/error_response_model.dart';
import 'package:flutter_riverpod_base/data/model/responseModel/login_with_mobile_rm.dart';
import 'package:flutter_riverpod_base/data/model/responseModel/user_login_rm.dart';
import 'package:flutter_riverpod_base/utils/app_constant/urls.dart';

part 'api_client.g.dart';

abstract class ApiClient {
  factory ApiClient(Dio dio, AppPreferencesHelper appPreferencesHelper,
      {required String baseUrl}) = _ApiClient;
  Future<BaseResponseModel<LoginWithMobileRm>> mobileLogin(Map<String, String> map,BuildContext context,);
  Future<BaseResponseModel<UserLoginRm>> userVerify(Map<String, String> map,BuildContext context,);
  Future<BaseResponseModel<CheckUpdateRm>> checkUpdate( BuildContext context);
  Future<bool> downloadApp(String? filePathToDownload, String path, ProgressCallback onReceiveProgress);


}
