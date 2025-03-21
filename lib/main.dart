import 'package:flutter/material.dart';
import 'package:infoklub/viewmodels/eduinfo_viewmodel.dart';
import 'package:infoklub/viewmodels/mdcn_viewmodel.dart';
import 'package:infoklub/viewmodels/signup_viewmodel.dart';
import 'package:infoklub/viewmodels/splash_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:infoklub/app/theme.dart';
import 'package:infoklub/app/routes.dart';
import 'viewmodels/healthdata_viewmodel.dart';
import 'viewmodels/home_viwmodel.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/phone_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => PhoneViewmodel()),
        ChangeNotifierProvider(create: (_) => HealthDataViewModel()),
        ChangeNotifierProvider(create: (_) => MdcnDataViewModel()),
        ChangeNotifierProvider(create: (_) => EduinfoViewmodel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getThemeData(context),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
