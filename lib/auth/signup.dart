import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/auth/login.dart';
import 'package:groceries_flutter_app/components/coustom_button.dart';
import 'package:groceries_flutter_app/components/coustom_textfield.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';
import 'package:groceries_flutter_app/utils/util_function.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52,),
                const CustomText(text: "SignUp",color: AppColor.primaryColor, fontSize: 30,fontWeight: FontWeight.w500),
                Image.asset(AppComponents.splashLogo, width: 202, height: 138,),
                const SizedBox(height: 32,),
                const CoustomTextField(hintText: "Name"),
                const SizedBox(height: 8,),
                const CoustomTextField(hintText: "Email"),
                const SizedBox(height: 8,),
                const CoustomTextField(hintText: "Password", isObscure: true),
                const SizedBox(height: 16,),
                InkWell(
                  onTap: () => UtilFunctions.navigateTo(context, const Login()),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                    text: "Already have account?",
                    fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 29,),
                CoustomButton(btnText: "SignUp", onTap: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





