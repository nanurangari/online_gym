import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utility {
  //Check Internet Connection
  static Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi)
      return true;
    else
      return false;
  }

  static Future<bool> writeLocalStorage(
      String localStorageKey, String value) async {
    late SharedPreferences localStorage;
    localStorage = await SharedPreferences.getInstance();
    return localStorage.setString(localStorageKey, value);
  }

  static Future<String> readLocalStorage(String localStorageKey) async {
    late SharedPreferences localStorage;
    localStorage = await SharedPreferences.getInstance();
    return localStorage.getString(localStorageKey) ?? "";
  }

  static Future<bool> removeLocalStorageKey(String localStorageKey) async {
    var localStorage = await SharedPreferences.getInstance();
    return localStorage.remove(localStorageKey);
  }

  static Future<bool> clearLocalStorage() async {
    late SharedPreferences localStorage;
    localStorage = await SharedPreferences.getInstance();
    return localStorage.clear();
  }
}

Future<ToastFuture> showCustomToast(BuildContext context, String? msg) async {
  return showToast(
    msg ?? 'Please check your internet connection and try again',
    context: context,
    axis: Axis.horizontal,
    alignment: Alignment.center,
    position: StyledToastPosition.top,
    toastHorizontalMargin: 20,
    fullWidth: true,
    duration: Duration(seconds: 3),
  );
}

Future<AwesomeDialog> customAlertForError(
    BuildContext context, String title, String desc) async {
  return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      headerAnimationLoop: true,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
      btnOkColor: Colors.red)
    ..show();
}
