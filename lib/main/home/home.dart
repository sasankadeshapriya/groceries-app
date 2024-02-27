import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/controllers/auth_controller.dart';
import 'package:groceries_flutter_app/main/home/widget/product_grid.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
       padding: const EdgeInsets.only(left: 28, right: 28, top: 30),
       child: Column(
         children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppComponents.menuIcon),
              Row(
                children: [
                  SvgPicture.asset(AppComponents.basketIcon),
                  IconButton(onPressed: (){
                    AuthController().logout();
                  }, icon: const Icon(Icons.logout)),
                ],
              ),
            ],
           ),
          const CustomText(text: "Fruits",fontSize: 20,fontWeight: FontWeight.w600,color: AppColor.primaryColor),
          const SizedBox(height: 41,),
          const ProductGrid(),
         ],
       ),
      ),
    );
  }
}

