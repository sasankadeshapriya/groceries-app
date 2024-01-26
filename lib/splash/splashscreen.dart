import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/auth/signup.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';
import 'package:groceries_flutter_app/utils/util_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5),(){
      UtilFunctions.navigateTo(context, const SignUp());
    });
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
              child: Image.asset(AppComponents.splashLogo, width: 200,)
            ),
            const SizedBox(height: 30,),
            FadeInUp(child: const CustomText(text: "ELEGANCE SKL GROCERIES",color: AppColor.primaryColor, fontSize: 35,fontWeight: FontWeight.w500,textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}