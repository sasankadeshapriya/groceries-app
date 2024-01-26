import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';

class CoustomTextField extends StatelessWidget {
  const CoustomTextField({
    super.key,
    required this.hintText,
    this.isObscure = false,
  });

  final String hintText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: AppColor.ashColor.withOpacity(.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColor.ashColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color:AppColor.whiteColor ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color:AppColor.redColor),
          ),
        ),
      ),
    );
  }
}