import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/log/log_bloc.dart';
import 'bloc/log/log_repo.dart';
import 'bloc/profile/profile_bloc.dart';
import 'bloc/profile/profile_repo.dart';
import 'bloc/startup/startup_bloc.dart';
import 'bloc/startup/startup_repo.dart';
import 'extras/extras.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await preferences.putAppDeviceInfo();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(MPRVWorkoutTracker());
}

class MPRVWorkoutTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        accentColor: Colors.white,
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
        Routes.HOME: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LogBloc(LogRepo()),
                ),
                BlocProvider(
                  create: (context) => ProfileBloc(ProfileRepo()),
                ),
              ],
              child: Home(),
            ),
        Routes.ADD_EDIT_LOG: (context) => BlocProvider(
              create: (context) {
                return LogBloc(LogRepo());
              },
              child: AddEditLog(),
            ),
        Routes.CHANGE_PASSWORD: (context) => BlocProvider(
              create: (context) => ProfileBloc(ProfileRepo()),
              child: ChangePassword(),
            ),
        Routes.VERIFY_PASSWORD: (context) => BlocProvider(
              create: (context) => StartupBloc(StartupRepo()),
              child: VerifyPassword(),
            ),
        Routes.EDIT_PROFILE: (context) => BlocProvider(
              create: (context) => ProfileBloc(ProfileRepo()),
              child: EditProfile(),
            ),
      },
      home: preferences.getBool(SharedPreference.IS_LOGGED_IN)
          ? MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LogBloc(LogRepo()),
                ),
                BlocProvider(
                  create: (context) => ProfileBloc(ProfileRepo()),
                ),
              ],
              child: Home(),
            )
          : Startup(),
    );
  }
}
