import 'package:flutter/material.dart';

class SplashScreenViewModel extends ChangeNotifier {
  late AnimationController controller;
  late Animation<double> animation;

  bool isInitialized = false;

  void initializeAnimation(TickerProvider vsync) {
    if (!isInitialized) {
      controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: vsync,
      );

      animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
      controller.forward();

      isInitialized = true;
      notifyListeners();
    } // start animation
  }

  void navigateAfterDelay(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 7),
      () {
        Navigator.pushReplacementNamed(context, '/login');
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
