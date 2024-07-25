import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceries_flutter_app/auth/signup.dart';
import 'package:groceries_flutter_app/components/aleart_dialogbox.dart';
import 'package:groceries_flutter_app/main/main_screen.dart';
import 'package:groceries_flutter_app/utils/util_function.dart';
import 'package:logger/logger.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        AleartBox.showAleart(context, DialogType.error, 'ERROR', e.code);
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        AleartBox.showAleart(context, DialogType.error, 'ERROR', e.code);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      AleartBox.showAleart(context, DialogType.error, 'ERROR', e.toString());
    }
  }

  //---------Save User Data to Firestore
  Future<void> saveUserData(String userId, String name, String email) {
    return users
        .doc(userId)
        .set(
          {'uid': userId, 'name': name, 'email': email},
          SetOptions(merge: true),
        )
        .then((value) => Logger().i("User Added!"))
        .catchError((error) => Logger().e("Fail to Add!"));
  }

  Future<void> registerUser(
      BuildContext context, String email, String password, String name) async {
    try {
      final credential = await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        if (value.user != null) {
          await saveUserData(value.user!.uid, name, email);
          AleartBox.showAleart(context, DialogType.success, 'SUCCESS',
              'Account created success!');
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        AleartBox.showAleart(context, DialogType.error, 'ERROR', e.code);
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        AleartBox.showAleart(context, DialogType.error, 'ERROR', e.code);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      AleartBox.showAleart(context, DialogType.error, 'ERROR', e.toString());
    }
  }

  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        UtilFunctions.navigateTo(context, const SignUp());
      } else {
        UtilFunctions.navigateTo(context, const MainScreen());
      }
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendPasswordResetEmail(
      BuildContext context, String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      AleartBox.showAleart(
          context, DialogType.success, "Email sent", "Check your inbox");
    });
  }
}
