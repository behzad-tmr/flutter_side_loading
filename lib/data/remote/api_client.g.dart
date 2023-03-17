part of 'api_client.dart';


class _ApiClient implements ApiClient {
  _ApiClient(this._dio, this.appPreferencesHelper, {required this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl = Urls.apiUrl;
    _dio.interceptors.add(LogInterceptor());
    _dio.options.baseUrl = baseUrl;
    _dio.options.followRedirects = true;
    _dio.options.headers['content-Type'] = 'application/json';
  }

  final Dio _dio;
  AppPreferencesHelper appPreferencesHelper;

  String baseUrl;

  @override
  Future<BaseResponseModel<LoginWithMobileRm>> mobileLogin(Map<String, String> map,
      BuildContext context,) async {
    await handleToken();
    BaseResponseModel<LoginWithMobileRm> value = BaseResponseModel();

    try {
      final _result = await _dio.post(Urls.authMobileLogin, data: map);
      value.data=LoginWithMobileRm.fromJson(_result.data);
      value.isSuccess = true;
    } on DioError catch (e) {
      value.errorResponseModel = ErrorResponseModel.fromJson(e.response!.data);
      value.isSuccess = false;
      await handleError(e, context);
    }
    return value;
  }

  Future<void> handleToken() async {
    _dio.options.headers.remove('Authorization');
    String? token = await appPreferencesHelper.getAccessToken();
    if (token != null && token.isNotEmpty) {
      _dio.options.headers['Authorization'] = "JWT $token";
    }
  }

  Future<void> handleError(
      DioError dioError,
      BuildContext context,
      ) async {
    if (dioError.response!.statusCode == 401) {
      await appPreferencesHelper.userClear();
      await appPreferencesHelper.setUserLoggedInMode(0);
      _dio.options.headers.remove('Authorization');

    }
  }

  @override
  Future<BaseResponseModel<UserLoginRm>> userVerify(Map<String, String> map, BuildContext context) async {
    await handleToken();
    BaseResponseModel<UserLoginRm> value = BaseResponseModel();
    try {
      final _result = await _dio.post(Urls.authMobileVerify, data: map);
      value.data=UserLoginRm.fromJson(_result.data);
      value.isSuccess = true;
    } on DioError catch (e) {
      value.errorResponseModel = ErrorResponseModel.fromJson(e.response!.data);
      value.isSuccess = false;
      await handleError(e, context);
    }
    return value;
  }

  @override
  Future<BaseResponseModel<CheckUpdateRm>> checkUpdate( BuildContext context) async {
    BaseResponseModel<CheckUpdateRm> value = BaseResponseModel();
    final dio = Dio();
    try {
      final _result = await dio.get('http://45.129.36.166:7000/testserver/test', );
      value.data=CheckUpdateRm.fromJson(_result.data);
      value.isSuccess = true;
    } on DioError catch (e) {
      value.errorResponseModel = ErrorResponseModel.fromJson(e.response!.data);
      value.isSuccess = false;
      await handleError(e, context);
    }
    return value;
  }


  @override
  Future<bool> downloadApp(String? filePathToDownload, String path,
      ProgressCallback onReceiveProgress) async {
    try {
    final dio = Dio();
      await dio.download(path, filePathToDownload,
          onReceiveProgress: onReceiveProgress);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}