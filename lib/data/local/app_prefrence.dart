import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesHelper {
  Future<String?> getAccessToken();

  Future<void> setAccessToken(String accessToken);

  Future<int?> getUserLoggedInMode();

  Future<void> setUserLoggedInMode(int loggedInMode);

  Future<String> getApplicationTheme();

  Future<void> setApplicationTheme(String applicationTheme);

  Future<String?> getUserId();

  Future<void> setUserID(String id);

  Future<String?> getUserMobileNumber();

  Future<void> setUserMobileNumber(String mobileNumber);

  Future<void> userClear( );

}

class AppPreferencesHelper implements PreferencesHelper {
  static AppPreferencesHelper? appPreferencesHelper;

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_ACCESS_TOKEN = "PREF_KEY_ACCESS_TOKEN";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_LOGGED_IN_MODE = "PREF_KEY_USER_LOGGED_IN_MODE";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_APPLICATION_THEME = "PREF_KEY_APPLICATION_THEME";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_ID= "PREF_KEY_USER_ID";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_MOBILE_NUMBER= "PREF_KEY_USER_MOBILE_NUMBER";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_PROFILE_SELECTED_ID= "PREF_KEY_USER_PROFILE_SELECTED_ID";

  @override
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_ACCESS_TOKEN);
  }

  @override
  Future<int> getUserLoggedInMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_KEY_USER_LOGGED_IN_MODE) ?? 0;
  }

  @override
  Future<void> setAccessToken(String? accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_ACCESS_TOKEN, accessToken!);
  }

  @override
  Future<void> setUserLoggedInMode(int loggedInMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_PREF_KEY_USER_LOGGED_IN_MODE, loggedInMode);
  }

  @override
  Future<void> userClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedId= prefs.getInt(_PREF_KEY_USER_PROFILE_SELECTED_ID);
    await prefs.clear();
    await prefs.setInt(_PREF_KEY_USER_LOGGED_IN_MODE, 0);
    await prefs.setInt(_PREF_KEY_USER_PROFILE_SELECTED_ID, selectedId ?? 0);
    // print('hear 01');
  }

  @override
  Future<String> getApplicationTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_APPLICATION_THEME) ?? 'dark';
  }

  @override
  Future<void> setApplicationTheme(String applicationTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_APPLICATION_THEME, applicationTheme);

  }



  @override
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_ID);
  }

  @override
  Future<void> setUserID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_ID, id);
  }

  @override
  Future<String?> getUserMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_MOBILE_NUMBER);
  }

  @override
  Future<void> setUserMobileNumber(String mobileNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_MOBILE_NUMBER, mobileNumber);
  }

  @override
  Future<int?> getUserProfileSelectedId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_KEY_USER_PROFILE_SELECTED_ID);
  }

  @override
  Future<void> setUserProfileSelectedId(int userProfileSelectedId)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_PREF_KEY_USER_PROFILE_SELECTED_ID, userProfileSelectedId);
  }

}
