import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/auth/forget_password.dart';
import 'package:groceries_flutter_app/components/aleart_dialogbox.dart';
import 'package:groceries_flutter_app/components/coustom_button.dart';
import 'package:groceries_flutter_app/components/coustom_textfield.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/components/social_button.dart';
import 'package:groceries_flutter_app/controllers/auth_controller.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';
import 'package:groceries_flutter_app/utils/util_function.dart';
import 'package:logger/logger.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;

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
                const SizedBox(
                  height: 52,
                ),
                const CustomText(
                    text: "Login",
                    color: AppColor.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 25,
                ),
                SvgPicture.asset(AppComponents.signUp, width: 175, height: 175),
                const SizedBox(
                  height: 32,
                ),
                CoustomTextField(
                    hintText: "Email", controller: emailController),
                const SizedBox(
                  height: 8,
                ),
                CoustomTextField(
                    hintText: "Password",
                    isObscure: true,
                    controller: passwordController),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () =>
                      UtilFunctions.navigateTo(context, const ForgetPassword()),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "Forgot your password?",
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                CoustomButton(
                    isLoading: isLoading,
                    btnText: "Login",
                    onTap: () async {
                      if (validateFiled()) {
                        setState(() {
                          isLoading = true;
                        });

                        await AuthController().signInUser(context,
                            emailController.text, passwordController.text);

                        emailController.clear();
                        passwordController.clear();

                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        Logger().i("Validate Faild");
                      }
                    }),
                const SizedBox(
                  height: 23,
                ),
                const CustomText(
                  text: "or login with social account",
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                        iconPath: AppComponents.googleIcon, onTap: () {}),
                    const SizedBox(
                      width: 16,
                    ),
                    SocialIcon(
                        iconPath: AppComponents.facebookIcon, onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFiled() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      AleartBox.showAleart(
          context, DialogType.error, 'ERROR', 'Please fill all fields!');
      return false;
    } else if (!emailController.text.contains('@')) {
      AleartBox.showAleart(context, DialogType.error, 'ERROR',
          'Please enter valid email address!');
      return false;
    } else if (passwordController.text.length < 6) {
      AleartBox.showAleart(context, DialogType.error, 'ERROR',
          'Please enter valid email address!');
      return false;
    } else {
      return true;
    }
  }
}
