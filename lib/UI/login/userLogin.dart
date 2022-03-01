import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:onlinegym/UI/dashboard/home.dart';
import 'package:onlinegym/utilities/utility.dart';
import 'package:onlinegym/widgets/imageWidget.dart';
import 'package:onlinegym/widgets/loginUI.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'changePassword.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({
    Key? key,
  }) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final userLoginKey = GlobalKey<FormState>();
  var cntForMobileNo = TextEditingController();
  var cntForPassWord = TextEditingController();
  String schoolGroupName = "", imgUrl = "";
  bool _isHidden = true;

  @override
  void initState() {
    setSchoolGroupData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginUI(
      height: 0.9,
      child: Form(
        key: userLoginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ImageWithAsset(
                path: 'images/Logo.jpg',
                height: 58,
                width: 58,
                boxFit: BoxFit.fill,
              ),
            ),
            SizedBox(),
            Center(
              child: Text(
                this.schoolGroupName,
                textScaleFactor: 1.0,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(),
            CustomTextField(
              controller: cntForMobileNo,
              hintText: 'Mobile No',
              prefixIcon: Icon(Icons.phone),
              textInputType: TextInputType.text,
              validator: MultiValidator([
                RequiredValidator(
                    errorText: "Please Enter Mobile number or Email id")
              ]),
            ),
            SizedBox(),
            CustomTextField(
              controller: cntForPassWord,
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
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
                  [RequiredValidator(errorText: "Please Enter Password")]),
            ),
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  text: "Sign in",
                  width: size.width * .3,
                  onBtnPressed: () => userSignIn(),
                ),
                SizedBox(),
                RichText(
                  text: TextSpan(
                    text: 'Forget Password ?',
                    style: Theme.of(context).textTheme.headline3,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChangePassword()));
                      },
                  ),
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  void setSchoolGroupData() async {
    // var schoolGroupData = await Utility.readLocalStorage(
    //     localStorageKeyEnum.SchoolGroupLoginResponse.toString());
    // var objSchoolGroupData = convert.jsonDecode(schoolGroupData);
    setState(() {
      // this.schoolGroupName = objSchoolGroupData['ClientName'];
      this.schoolGroupName = "Online Gym";
    });
  }

  void userSignIn() async {
    try {
      SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
          context: context, barrierDimisable: false);
      //Chek Internet Connection
      if (await Utility.isInternet()) {
        if (userLoginKey.currentState!.validate()) {
          dialog.show(
              message: "Please Wait",
              type: SimpleFontelicoProgressDialogType.spinner,
              elevation: 5.0);

          if(cntForMobileNo.text == "9898989898" && cntForPassWord.text =="123")
          {
            Timer(
              Duration(seconds: 3),
                  () {
                dialog.hide();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            );
          }else{
            Timer(
              Duration(seconds: 2),
                  () {
                    dialog.hide();
                    customAlertForError(context, 'Invalid', "Login credentials is invalid please try agin ");
              },
            );
          }
        }
      } else {
        showCustomToast(context, null);
      }
    } catch (ex) {}
  }
}
