import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/data/local/app_prefrence.dart';
import 'package:flutter_riverpod_base/data/remote/api_client.dart';
import 'package:flutter_riverpod_base/utils/app_constant/urls.dart';


final appPreferenceHelperProvider = Provider<AppPreferencesHelper>((ref) => AppPreferencesHelper());

final urlProvider = Provider<String>((ref) => Urls.apiUrl);

final dioProvider = Provider<Dio>((ref) => Dio(BaseOptions(contentType: "application/json")));

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(
    ref.read(dioProvider), ref.read(appPreferenceHelperProvider),
    baseUrl: ref.read(urlProvider)));
