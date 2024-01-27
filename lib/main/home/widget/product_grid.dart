import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/utils/app_colors.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 19, mainAxisSpacing: 25), 
        itemBuilder: (context,i){
        return Container(
          color: AppColor.greenColor,
        );
      }),
    );
  }
}