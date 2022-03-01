import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key? key, this.pageName}) : super(key: key);
  String? pageName;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(widget.pageName ?? "Edusprint+"),
      centerTitle: true,
      actions: [
        IconButton(
          tooltip: 'Settings',
          enableFeedback: true,
          icon: Icon(
            CupertinoIcons.gear_alt_fill,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
