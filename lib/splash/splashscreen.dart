import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/controllers/auth_controller.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 5),(){
    //   UtilFunctions.navigateTo(context, const SignUp());
    // });

    AuthController().initializeUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              // delay: const Duration(seconds: 1),
              child: SvgPicture.asset(AppComponents.logoIcon,
                  width: 123, height: 123),
            ),
            const SizedBox(
              height: 30,
            ),
            FadeInUp(
              child: SvgPicture.asset(
                AppComponents.logoText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
