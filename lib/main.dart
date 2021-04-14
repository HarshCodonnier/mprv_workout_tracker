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
        canvasColor: appColor,
      ),
      initialRoute: Routes.STARTUP,
      routes: {
        Routes.STARTUP: (context) => Startup(),
        Routes.FORGOT_PASSWORD: (context) => ForgotPassword(),
        Routes.HOME: (context) => Home(),
        Routes.ADD_EDIT_LOG: (context) => AddEditLog(),
      },
    );
  }
}
