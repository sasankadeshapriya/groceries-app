import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(text: "Search"),
      ),
    );
  }
}