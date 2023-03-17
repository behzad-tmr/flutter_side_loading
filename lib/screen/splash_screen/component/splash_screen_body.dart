import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod_base/screen/splash_screen/viewModel/splash_screen_view_model.dart';
import 'package:flutter_riverpod_base/utils/app_constant/strings.dart';

class SplashScreenBody extends ConsumerWidget {
  SplashScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(splashScreenViewModelProvider);
    if (viewModel.isFirstTime) {
      viewModel.isFirstTime = false;
      viewModel.findNavigationPage(context, ref);
    }
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_security.svg',
                color: Colors.white,
                width: 96,
                height: 96,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Text(
                  Strings.appName,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                ),
              ),
              if (viewModel.getUpdateIsNeeded())
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Text(
                    Strings.updateInProgress,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                  ),
                ),
              if (viewModel.getUpdateIsNeeded())
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 44,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                        value: viewModel.downloadProgress,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '${viewModel.getAppVersion() ?? ''} ${Strings.version}',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
