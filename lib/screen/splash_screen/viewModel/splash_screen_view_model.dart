import 'dart:io';

import 'package:app_installer/app_installer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/application/data_provider.dart';
import 'package:flutter_riverpod_base/base/base_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';


class SplashScreenViewModel extends BaseViewModel {
  String? _appVersion;
  String? _appBuildNumber;
  double downloadProgress = 0;
  String? _nextPage;
  //bool _firstInit=true;
  bool isFirstTime=true;
  bool _updateIsNeeded =false;


  SplashScreenViewModel() {
    //_getPackageName();
  }

  Future<void> _getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    _appBuildNumber = packageInfo.buildNumber;
    notifyListeners();
  }


  String? getAppVersion() {
    return _appVersion;
  }
  bool getUpdateIsNeeded() {
    return _updateIsNeeded;
  }

  String? getAppBuildNumber() {
    return _appBuildNumber;
  }


  Future<void> findNavigationPage(BuildContext context, WidgetRef ref,) async {

    await _getPackageName();
    final response = await ref.watch(apiClientProvider).checkUpdate(context);
    if (response.data != null){
      if (response.data!.buildNumber != _appBuildNumber){
        print ("appBuildNumber : "+_appBuildNumber.toString());
        print ("ServerBuildNumber : "+response.data!.buildNumber.toString());
        if (response.data?.link.isNotEmpty ?? false  ) {
          downloadFile(
              ref, context, response.data?.version ?? '', response.data!.link);
        }
        _updateIsNeeded = true;
        notifyListeners();
        }
    }

  }

  Future<void> downloadFile(WidgetRef ref, BuildContext context, String appVersion,
      String appDownloadLink) async {
    //Directory? directory;
    //    setIsLoading();
    final directory = await getExternalStorageDirectory();
    String downloadPath = directory!.absolute.path + "/tmr_${appVersion}.apk";
    if(kDebugMode) {
      print("path is ${downloadPath}");
    }
    if (await File(downloadPath).exists()) {
      await File(downloadPath).delete();
    }
    await ref.watch(apiClientProvider).downloadApp(
      downloadPath,
      appDownloadLink,
          (count, total) async {
        //total = 137200 ;
        print (count);
        downloadProgress = count / total;
        notifyListeners();
        if (downloadProgress >= 1.0) {
         // cancelIsLoading();
          downloadProgress = 1.0;
          //showMessage(Strings.downloadSuccessfully, context, false);
          downloadProgress = 0;
          await Future.delayed(Duration(seconds: 2));
           AppInstaller.installApk(downloadPath);
          _updateIsNeeded =false;
          notifyListeners();
        }
      },
    );
    if(kDebugMode) {
      print("path is ${downloadPath}");
    }


  }




}

final splashScreenViewModelProvider =
    ChangeNotifierProvider<SplashScreenViewModel>(
  (ref) => SplashScreenViewModel(),
);
