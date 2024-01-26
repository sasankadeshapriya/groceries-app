import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  final String iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColor.ashColor.withOpacity(0.5),
              offset: const Offset(0, 5),
              blurRadius: 5,
            ),
          ],
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}