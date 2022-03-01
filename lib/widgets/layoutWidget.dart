import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinegym/UI/login/userLogin.dart';
import 'drawerWidget.dart';

class LayoutWidget extends StatelessWidget {
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget child;
  const LayoutWidget(
      {Key? key,
      this.appBar,
      this.drawer,
      this.bottomNavigationBar,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        right: true,
        bottom: true,
        left: true,
        maintainBottomViewPadding: true,
        child: Scaffold(
            appBar: appBar ??
                AppBar(
                  elevation: 0,
                  title: Text("Edusprint+"),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  actions: [
                    IconButton(
                      tooltip: 'LogOut',
                      enableFeedback: true,
                      color: Colors.blue,
                      icon: Icon(
                        Icons.logout,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserLogin()));
                      },
                    ),
                  ],
                ),
            drawer: drawer ?? DrawerWidget(),
            bottomNavigationBar: bottomNavigationBar,
            body: child));
  }
}
