import 'package:flutter/material.dart';
import 'package:infoklub/app/theme.dart';
import 'package:infoklub/viewmodels/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenViewModel(),
      child: Consumer<SplashScreenViewModel>(
        builder: (context, viewModel, child) {
          if (!viewModel.isInitialized) {
            viewModel.initializeAnimation(this);
            viewModel.navigateAfterDelay(context);
          }

          return Scaffold(
            backgroundColor: AppTheme.whiteColor,
            body: Center(
              child: FadeTransition(
                opacity: viewModel.animation,
                child: Image.asset(
                  'lib/assets/Images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
