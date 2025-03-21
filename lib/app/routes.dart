import 'package:flutter/material.dart';
import 'package:infoklub/views/authentecation_view/forgot_password.dart';
import 'package:infoklub/views/authentecation_view/otp.dart';
import 'package:infoklub/views/authentecation_view/phone_number_screen.dart';
import 'package:infoklub/views/authentecation_view/signup_screen.dart';
import 'package:infoklub/views/create_profile/add_info_dashboard.dart';
import 'package:infoklub/views/create_profile/addlink.dart';
import 'package:infoklub/views/education_data/edu_info.dart';
import 'package:infoklub/views/health_screens/health_dashboard.dart';
import 'package:infoklub/views/health_screens/health_data.dart';
import '../views/career_screens/career_data.dart';
import '../views/create_profile/profile_setup.dart';
import '../views/authentecation_view/login_screen.dart';
import '../views/health_screens/mdcn_data.dart';
import '../views/onboarding_screens_view/onboarding_screen_one.dart';
import '../views/splash_view/splash_screens.dart';

class AppRoutes {
  static const String splash = '/';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String phone = '/phone';
  static const String otp = '/otp';
  static const String forgotpsd = '/forgotpsd';
  static const String onboardfirst = '/onboardfirst';
  static const String addlinks = '/addlinks';
  static const String infodashboard = '/infodashboard';
  static const String health = '/health';
  static const String mdcndata = '/mdcndata';
  static const String healthdboard = '/healthdboard';
  static const String eduData = '/eduData';
  static const String career = '/career';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreens());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileSetup());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case phone:
        return MaterialPageRoute(builder: (_) => const PhoneNumberScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case forgotpsd:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case onboardfirst:
        return MaterialPageRoute(builder: (_) => const OnboardOne());
      case addlinks:
        return MaterialPageRoute(builder: (_) => const Addlink());
      case infodashboard:
        return MaterialPageRoute(builder: (_) => const ProfileOptions());
      case health:
        return MaterialPageRoute(builder: (_) => const HealthData());
      case mdcndata:
        return MaterialPageRoute(builder: (_) => const MdcnData());
      case healthdboard:
        return MaterialPageRoute(builder: (_) => const HealthDashboard());
      case eduData:
        return MaterialPageRoute(builder: (_) => const EduInfo());
      case career:
        return MaterialPageRoute(builder: (_) => const CareerData());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
