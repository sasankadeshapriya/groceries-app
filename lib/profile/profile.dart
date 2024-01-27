import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/components/custom_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(text: "Profile"),
      ),
    );
  }
}