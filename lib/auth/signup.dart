import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/auth/login.dart';
import 'package:groceries_flutter_app/components/aleart_dialogbox.dart';
import 'package:groceries_flutter_app/components/coustom_button.dart';
import 'package:groceries_flutter_app/components/coustom_textfield.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/controllers/auth_controller.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';
import 'package:groceries_flutter_app/utils/util_function.dart';
import 'package:logger/logger.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

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
                    text: "SignUp",
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
                CoustomTextField(hintText: "Name", controller: nameController),
                const SizedBox(
                  height: 8,
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
                  onTap: () => UtilFunctions.navigateTo(context, const Login()),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "Already have account?",
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                CoustomButton(
                    isLoading: isLoading,
                    btnText: "SignUp",
                    onTap: () async {
                      if (validateFiled()) {
                        setState(() {
                          isLoading = true;
                        });

                        await AuthController().registerUser(
                            context,
                            emailController.text,
                            passwordController.text,
                            nameController.text);

                        emailController.clear();
                        nameController.clear();
                        passwordController.clear();

                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        Logger().i("Validate Faild");
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFiled() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
