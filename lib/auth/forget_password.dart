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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({ Key? key }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

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
                const SizedBox(height: 52,),
                const CustomText(text: "Forgot Password",color: AppColor.primaryColor, fontSize: 30,fontWeight: FontWeight.w500),
                const SizedBox(height: 25,),
                SvgPicture.asset(AppComponents.signUp, width: 175, height: 175),
                const SizedBox(height: 100,),
                const CustomText(text: "Please enter your email to receive password reset mail!", fontSize: 14),
                const SizedBox(height: 8,),
                CoustomTextField(hintText: "Email",controller: emailController),
                const SizedBox(height: 16,),
                InkWell(
                  onTap: () => UtilFunctions.navigateTo(context, const Login()),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                    text: "Go to Login",
                    fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 29,),
                CoustomButton(btnText: "Forgot Password", onTap: () async{
                  if(validateFiled()){

                    setState(() {
                      isLoading = true;
                    });

                    await AuthController().sendPasswordResetEmail(context,emailController.text);

                    emailController.clear();

                    setState(() {
                      isLoading = false;
                    });     

                  }else{
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
    if(emailController.text.isEmpty){
      AleartBox.showAleart(context,DialogType.error,'ERROR','Please fill all fields!');
      return false;
    }else if(!emailController.text.contains('@')){
      AleartBox.showAleart(context,DialogType.error,'ERROR','Please enter valid email address!');
      return false;    
    }else{
      return true;
    }
  }
}





