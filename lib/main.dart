import 'package:flutter/material.dart';
import 'package:onlinegym/UI/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var them = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.blue.shade200,
        highlightColor: Colors.blue.shade100,
        scaffoldBackgroundColor: Colors.grey[200],
        primaryIconTheme: IconThemeData(color: Colors.white),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.blue.shade200,
          background: Colors.white,
          secondary: Colors.white,

        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue.shade200,
          iconTheme: IconThemeData(color: them.colorScheme.secondary),
          titleSpacing: 20,
          centerTitle: false,
          elevation: 10,
        ),
        tabBarTheme: TabBarTheme(
            labelColor: them.colorScheme.primary,
            unselectedLabelColor: them.colorScheme.primaryVariant,
            indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)))),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          backgroundColor: them.colorScheme.background,
          elevation: 8.0,
          selectedItemColor: them.colorScheme.primary,
          unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
          showSelectedLabels: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                elevation: MaterialStateProperty.all(6),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                textStyle: MaterialStateProperty.all(TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )))),
        textTheme: const TextTheme(
          headline2: TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
          headline3: TextStyle(
            color: Colors.blue,
            fontSize: 15,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.blue,
            floatingLabelBehavior: FloatingLabelBehavior.auto),
        cardTheme: CardTheme(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade300, width: 1),
            )),
        dataTableTheme: DataTableThemeData(
          decoration: BoxDecoration(shape: BoxShape.rectangle),
          headingRowHeight: 35,
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade400),
          dataRowHeight: 40,
        ),
      ),
      home:Splashscreen(),
    );
  }
}
