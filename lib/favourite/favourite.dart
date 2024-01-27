import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(text: "Fav"),
      ),
    );
  }
}