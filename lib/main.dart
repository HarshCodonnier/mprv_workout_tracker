import 'package:flutter/material.dart';

import 'extras/extras.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      initialRoute: Routes.LOGIN_ROUTE,
      routes: {Routes.LOGIN_ROUTE: (context) => Login()},
    );
  }
}
