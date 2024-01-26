import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';

class CoustomButton extends StatelessWidget {
  const CoustomButton({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  final String btnText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 259,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CustomText(text: btnText,color: AppColor.whiteColor,fontSize: 18,fontWeight: FontWeight.w600,),
      ),
    );
  }
}