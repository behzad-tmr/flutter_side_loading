class FormValidator {
  static FormValidator? _instance;

  factory FormValidator() => _instance ?? new FormValidator._();

  FormValidator._();

  String? validatePhoneNumber(String? value) {

    if (value?.isEmpty == true) {
      return notEmpty(value);
    } else if (value?.length != 11) {
      return "Number needs to be in 11 digits";
    } else {
      return null;
    }
  }

  String? validateOtpCode(String? value) {
    if (value?.isEmpty == true) {
      return notEmpty(value);
    } else if (value?.length != 4) {
      return "Otp code is not correct ";
    } else {
      return null;
    }
  }

  String? validateNationalCode(String? value) {
    if (value?.isEmpty == true) {
      return notEmpty(value);
    } else if (value!.length != 10) {
      return "National code is not correct";
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    if (value?.isEmpty == true) {
      return "Please fill this field";
    } else {
      return null;
    }
  }
}
