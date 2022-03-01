import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:ui';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginUI extends StatefulWidget {
  final Widget child;
  final double height;
  const LoginUI({Key? key, required this.child, required this.height})
      : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text('Tap back again to leave'),
      ),
      child: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              // child: SizedBox(
              //   height: size.height,
              child: Container(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: _opacity.value,
                  child: Transform.scale(
                    scale: _transform.value,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          width: size.width * .9,
                          height: size.width * widget.height,
                          //height: size.width * 1.1,
                          child: widget.child),
                    ),
                  ),
                ),
              ),
            ),
          )),
    )));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

class CustomTextField1 extends StatelessWidget {
  final TextEditingController? controller;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isPassword;
  final TextInputType textInputType;
  final MultiValidator validator;

  const CustomTextField1({
    Key? key,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.isPassword = false,
    required this.textInputType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      //width: size.width / 1.22,
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        controller: controller,
        obscureText: isPassword,
        keyboardType: textInputType,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: InputBorder.none,
          hintMaxLines: 1,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    required this.textInputType,
    this.validator,
    this.isreadOnly = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final TextInputType textInputType;
  //final MultiValidator validator;
  final String? Function(String?)? validator;
  final bool isreadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: isreadOnly,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          filled: false,
          fillColor: Colors.black.withOpacity(.05),
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0)),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    Key? key,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.isPassword = false,
    required this.textInputType,
    this.validator,
    this.isreadOnly = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isPassword;
  final TextInputType textInputType;
  //final MultiValidator validator;
  final String? Function(String?)? validator;
  final bool isreadOnly;

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: textInputType,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: isreadOnly,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.black.withOpacity(.05),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
      ),
    );
  }
}

class CustomProgressButton extends StatelessWidget {
  final RoundedLoadingButtonController btnController;
  final Function onBtnPressed;
  final double? height, width;
  final Widget widget;

  const CustomProgressButton(
      {Key? key,
      required this.btnController,
      required this.onBtnPressed,
      required this.widget,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RoundedLoadingButton(
      height: size.width / 8,
      width: width ?? size.width,
      child: widget,
      controller: btnController,
      animateOnTap: true,
      successIcon: Icons.check,
      successColor: Colors.green.shade300,
      failedIcon: Icons.cancel_rounded,
      errorColor: Colors.red.shade400,
      elevation: 4,
      onPressed: onBtnPressed(),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.text,
      this.onBtnPressed,
      this.width,
      this.height,
      this.backgroundColor})
      : super(key: key);

  final VoidCallback? onBtnPressed;
  final double? height, width;
  final String text;
  final MaterialStateProperty<Color?>? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onBtnPressed,
      style: ButtonStyle(
        backgroundColor: backgroundColor,
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 44,
        width: width ?? size.width * .3,
        child: Text(
          text,
          textScaleFactor: 1.0,
        ),
      ),
    );
  }
}

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField(
      {Key? key,
      required this.labelText,
      required this.items,
      this.selectedValue,
      this.validator,
      this.onChanged})
      : super(key: key);

  final String labelText;
  final List<DropdownMenuItem<dynamic>> items;
  final String? selectedValue;
  final String? Function(dynamic)? validator;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        value: selectedValue,
        validator: validator,
        onChanged: onChanged,
        items: items);
  }
}
