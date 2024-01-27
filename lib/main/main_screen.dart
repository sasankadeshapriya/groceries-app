import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/favourite/favourite.dart';
import 'package:groceries_flutter_app/main/home/home.dart';
import 'package:groceries_flutter_app/profile/profile.dart';
import 'package:groceries_flutter_app/search/search.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<Widget> screensList = [
    const Home(),
    const Favourite(),
    const Search(),
    const Profile(),
  ];

  int activeIndex = 0;

  void onItemTap(int i){
    setState(() {
      activeIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[activeIndex],
      bottomNavigationBar: SizedBox(
        height: 83,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: SvgPicture.asset(AppComponents.homeIcon,
                colorFilter: ColorFilter.mode(activeIndex == 0 ? AppColor.greenColor : AppColor.ashColorSub , BlendMode.srcIn),
              ),
              onTap: ()=> onItemTap(0),
            ),
            InkWell(
              child: SvgPicture.asset(AppComponents.favIcon,
                colorFilter: ColorFilter.mode(activeIndex == 1 ? AppColor.greenColor : AppColor.ashColorSub , BlendMode.srcIn),
              ),
              onTap: ()=> onItemTap(1),
            ),
            InkWell(
              child: SvgPicture.asset(AppComponents.searchIcon,
                colorFilter: ColorFilter.mode(activeIndex == 2 ? AppColor.greenColor : AppColor.ashColorSub , BlendMode.srcIn),
              ),
              onTap: ()=> onItemTap(2),
            ),
            InkWell(
              child: SvgPicture.asset(AppComponents.profileIcon,
                colorFilter: ColorFilter.mode(activeIndex == 3 ? AppColor.greenColor : AppColor.ashColorSub , BlendMode.srcIn),
              ),
              onTap: ()=> onItemTap(3),
            ),                                    
          ],
        ),
      ),
    );
  }
}