import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';

class CoustomButton extends StatelessWidget {
  const CoustomButton({
    super.key,
    required this.btnText,
    required this.onTap,
    this.isLoading = false,
  });

  final String btnText;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 259,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLoading? const CircularProgressIndicator(color: AppColor.whiteColor,) : CustomText(text: btnText,color: AppColor.whiteColor,fontSize: 18,fontWeight: FontWeight.w600,),
        ),
      ),
    );
  }
}