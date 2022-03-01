import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:onlinegym/UI/login/userLogin.dart';
import 'package:onlinegym/utilities/utility.dart';
import 'package:onlinegym/widgets/loginUI.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final changePasswordKey = GlobalKey<FormState>();
  var cntForOldPassword = TextEditingController();
  var cntForNewPassWord = TextEditingController();
  var cntForConfirmPassWord = TextEditingController();

  bool _isHidden = true;
  bool _isHiddenConfirmPass = true;
  bool _isHiddenOldPass = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginUI(
      height: .9,
      child: Form(
        key: changePasswordKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Center(
              child: Text(
                "Change Password",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(),
            CustomTextField(
              controller: cntForOldPassword,
              labelText: 'Old Password',
              prefixIcon: Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _isHiddenOldPass ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _isHiddenOldPass = !_isHiddenOldPass;
                    });
                  }),
              textInputType: TextInputType.text,
              isPassword: _isHiddenOldPass,
              validator: MultiValidator(
                  [RequiredValidator(errorText: "Please Enter Old Password")]),
            ),
            SizedBox(),
            CustomTextField(
              controller: cntForNewPassWord,
              labelText: 'New Password',
              prefixIcon: Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _isHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _isHidden = !_isHidden;
                    });
                  }),
              textInputType: TextInputType.text,
              isPassword: _isHidden,
              validator: MultiValidator(
                  [RequiredValidator(errorText: "Please Enter New Password")]),
            ),
            SizedBox(),
            CustomTextField(
              controller: cntForConfirmPassWord,
              hintText: 'Confirm Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black54,
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _isHiddenConfirmPass
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _isHiddenConfirmPass = !_isHiddenConfirmPass;
                    });
                  }),
              textInputType: TextInputType.text,
              isPassword: _isHiddenConfirmPass,
              validator: (val) =>
                  MatchValidator(errorText: "Passwords do not match")
                      .validateMatch(
                          cntForConfirmPassWord.text, cntForNewPassWord.text),
            ),
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  text: "Save",
                  width: size.width * .3,
                  onBtnPressed: () => changePassWord(),
                ),
                SizedBox(),
                CustomElevatedButton(
                  text: "Clear",
                  width: size.width * .3,
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  onBtnPressed: () {
                    setState(() {
                      cntForOldPassword.text = "";
                      cntForNewPassWord.text = "";
                      cntForConfirmPassWord.text = "";
                    });
                  },
                )
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  void changePassWord() async {
    try {
      SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
          context: context, barrierDimisable: false);
      if (await Utility.isInternet()) {
        if (changePasswordKey.currentState!.validate()) {
          dialog.show(
              message: "Please Wait",
              type: SimpleFontelicoProgressDialogType.spinner,
              elevation: 5.0);
          Timer(
            Duration(seconds: 3),
                () {
              dialog.hide();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => UserLogin()));
            },
          );
        }
      } else {
        showCustomToast(context, null);
      }
    } catch (e) {
      print("Error");
    }
  }
}
