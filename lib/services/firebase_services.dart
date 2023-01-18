// ignore_for_file: use_build_context_synchronously

import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:travel_app/views/start/create_new_password.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      throw e;
    }
  }

  //getting UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser!).uid;
  }

  signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw e;
    }
  }
  // signOUt()async{
  //  await _auth.signOut();
  //  await _googleSignIn.signOut();
  // }

  //-----Password-Reset-----//

  Future<void> passwordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: "Password reset link sent to : " + email);
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> sendOtp(String email, BuildContext context) async {
    try {
      var res = await EmailAuth(sessionName: 'Forget Password')
          .sendOtp(recipientMail: email);
      Fluttertoast.showToast(msg: "OTP has sent to : " + email);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const CreateNewPassword()));
    } catch (e) {
      print(e);
    }
  }
}
