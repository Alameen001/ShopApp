import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //register user

  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.message.toString(), "", backgroundColor: Colors.red);
    } catch (e) {
      print(e);
    }
  }

  //login

  Future<User?> Login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.message.toString(), "", backgroundColor: Colors.red);
    } catch (e) {
      print(e);
    }
  }

  //Google Sign in

  Future<User?> SignwithGoogle() async {
    try {
      // Triger the authentication dialog
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      if (googleuser != null) {
        //obtain the auth details from the reqst
        final GoogleSignInAuthentication googleAuth =
            await googleuser.authentication;
        //Creat a new credatiol
        final Credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        //once signed in retun the usser data from firebase
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(Credential);
        return userCredential.user;
      }
    } catch (e) {
      print(e);
    }
  }


  Future SignOut()async{
    await GoogleSignIn().signOut();
    await firebaseAuth.signOut();
  }
}
