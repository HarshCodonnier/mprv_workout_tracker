import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mprv_workout_tracker/screens/main/change_password.dart';
import 'package:mprv_workout_tracker/screens/main/edit_profile.dart';

import 'bloc/startup/startup_bloc.dart';
import 'bloc/startup/startup_repo.dart';
import 'extras/extras.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await preferences.putAppDeviceInfo();
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
      routes: {
        Routes.STARTUP: (context) => Startup(),
        Routes.FORGOT_PASSWORD: (context) => BlocProvider(
              create: (context) {
                return StartupBloc(StartupRepo());
              },
              child: ForgotPassword(),
            ),
        Routes.HOME: (context) => Home(),
        Routes.ADD_EDIT_LOG: (context) => AddEditLog(),
        Routes.CHANGE_PASSWORD: (context) => ChangePassword(),
        Routes.EDIT_PROFILE: (context) => EditProfile(),
      },
      home: preferences.getBool(SharedPreference.IS_LOGGED_IN)
          ? Home()
          : Startup(),
    );
  }
}
