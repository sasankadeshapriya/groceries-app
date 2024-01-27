import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';
import 'package:groceries_flutter_app/utils/app_components.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 19, mainAxisSpacing: 44), 
        itemBuilder: (context,i){
        return const ProductTile();
      }),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greenColor,
        borderRadius: BorderRadius.circular(12.0),
        image: const DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/kiwi-fruits-mesh-bag-close-up_169016-27370.jpg?w=740&t=st=1706373234~exp=1706373834~hmac=6a657af75632781e7f63dd47dc8b37b28d38e58286899ab4b6ce452f14da08ab"), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 10, right: 10),
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppComponents.favIcon)
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 9),
            decoration: BoxDecoration(
              color: AppColor.greenColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Kiwi fruits",color: AppColor.whiteColor, fontSize: 15,fontWeight: FontWeight.w500),
                CustomText(text: "\$5.10",color: AppColor.primaryColor, fontSize: 12,fontWeight: FontWeight.w600),
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}