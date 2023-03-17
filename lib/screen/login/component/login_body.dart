import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod_base/screen/component/button.dart';
import 'package:flutter_riverpod_base/screen/login/login_view_model/login_view_model.dart';
import 'package:flutter_riverpod_base/utils/app_constant/colors.dart';
import 'package:flutter_riverpod_base/utils/app_constant/strings.dart';
import 'package:flutter_riverpod_base/utils/form_validator.dart';

class LoginBody extends ConsumerWidget {
   LoginBody({
    Key? key,
  }) : super(key: key);
  final _mobileNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final viewModel = ref.watch(loginViewModelProvider);

    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: _height * .1),
                child: SvgPicture.asset(
                  'assets/icons/ic_security.svg',
                  color: Colors.blue,
                  width: 68,
                  height: 68,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _height * .03,
                ),
                child: Text(
                  Strings.appName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: blue,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _height * .09,
                ),
                child: Text(
                  Strings.welcome,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _height * .04,
                ),
                child: Text(
                  Strings.inputPhoneNumber,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 12,
                        color: Theme.of(context)
                            .textTheme
                            .headline6!
                            .color!
                            .withOpacity(.7),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: _width * 0.05, right: _width * .05, top: _height * .04),
                child: TextFormField(
                  controller: _mobileNumber,
                  textInputAction: TextInputAction.send,
                  validator: (value) =>
                      FormValidator().validatePhoneNumber(value),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration:
                      const InputDecoration(hintText: Strings.phoneNumberHint),
                ),
              )
            ],
          ),
        ),
        Positioned(
          child: Button(
            isLoading: viewModel.getLoading(),
            text: Strings.continues,
            onClick: () {
              if(_formKey.currentState!.validate()){
                viewModel.sendPhoneNumber(ref,context,_mobileNumber.text.toString());
              }
            },
            width: _width * 0.3,
            leftIconPath: 'assets/icons/ic_arrow_forward.svg',
          ),
          bottom: _height * .036,
          right: _width * .04,
        )
      ],
    );
  }
}
