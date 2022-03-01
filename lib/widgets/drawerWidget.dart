import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(),
          _createDrawerItem(icon: Icons.contacts, text: 'Contacts'),
          _createDrawerItem(icon: Icons.event, text: 'Events'),
          _createDrawerItem(icon: Icons.note, text: 'Notes'),
          Divider(),
          _createExpandableDrawerItem(
              icon: Icons.person_rounded,
              text: 'Profile',
              menuItemModel: [
                MenuItemModel(Icons.collections_bookmark, 'Steps'),
                MenuItemModel(Icons.face, 'Authors'),
                MenuItemModel(Icons.account_box, 'Flutter Documentation'),
                MenuItemModel(Icons.stars, 'Useful Links'),
              ]),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(title: Text('0.0.1'), onTap: () {}),
        ],
      ),
    );
  }

  //header
  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Colors.lightBlue),
      child: Stack(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("John Doe"),
          accountEmail: Text("johndoe@email.com"),
          currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
              ),
              onTap: () => print("Current User")),

          //.. This line of code provides the usage of multiple accounts
          otherAccountsPictures: <Widget>[
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80")),
            ),
            GestureDetector(onTap: () {}, child: Text('AB'))
          ],
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg")),
          ),
        ),
      ]),
    );
  }

  //Single Menu Item
  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  //Multilevel Menu Item
  Widget _createExpandableDrawerItem(
      {required IconData icon,
      required String text,
      List<MenuItemModel>? menuItemModel}) {
    final children = <Widget>[];
    menuItemModel!.forEach((element) {
      children.add(_createDrawerItem(
          icon: element.icon, text: element.text, onTap: element.onTap));
    });
    return ExpansionTile(
      title: Text(text),
      leading: Icon(icon),
      children: children,
    );
  }
}

class MenuItemModel {
  final IconData icon;
  final String text;
  GestureTapCallback? onTap;

  MenuItemModel(this.icon, this.text);
}
