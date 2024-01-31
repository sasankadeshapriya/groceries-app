import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/components/aleart_dialogbox.dart';

class AuthController{

  final FirebaseAuth auth =  FirebaseAuth.instance;

  Future<void> registerUser(BuildContext context, String email, String password)async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        if(value.user != null){
          AleartBox.showAleart(context,DialogType.success,'SUCCESS','Account created success!');
        }
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        AleartBox.showAleart(context,DialogType.error,'ERROR',e.code);
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        AleartBox.showAleart(context,DialogType.error,'ERROR',e.code);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      AleartBox.showAleart(context,DialogType.error,'ERROR',e.toString());
    }
  }
}