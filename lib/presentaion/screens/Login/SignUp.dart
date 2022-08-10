import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Screen_home.dart';
import 'package:shopx/Services/Auth_service.dart';
import 'package:shopx/presentaion/screens/Home/home_screen.dart';

import 'package:shopx/presentaion/widgets/TextForm/textform.dart';

class SighnUp extends StatefulWidget {
  SighnUp({Key? key}) : super(key: key);

  @override
  State<SighnUp> createState() => _SighnUpState();
}

class _SighnUpState extends State<SighnUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController conformpasswordController = TextEditingController();

  bool IsLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text("Create an account"),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: '  Login ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ])),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextInputfield(
                      hinttext: "Enter your Name",
                      Tcontroller: nameController,
                    ),
                    TextInputfield(
                      hinttext: "Enter your Email",
                      Tcontroller: emailController,
                    ),
                    TextInputfield(
                      hinttext: " Creat Password",
                      Tcontroller: passwordController,
                    ),
                    TextInputfield(
                      hinttext: "Confirm Password",
                      Tcontroller: conformpasswordController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    IsLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                IsLoading = true;
                              });
                              if (emailController.text == " " ||
                                  passwordController.text == "") {
                                Get.snackbar("All Feilds are Required !", "",
                                    backgroundColor: Colors.red);
                              } else if (passwordController.text !=
                                  conformpasswordController.text) {
                                Get.snackbar("Password dont Match !", "",
                                    backgroundColor: Colors.red);
                              } else {
                                User? result = await AuthService().register(
                                    emailController.text,
                                    passwordController.text);
                                if (result != null) {
                                  print("Sucsuss");
                                  print(result.email);
                                  Get.offUntil(
                                      MaterialPageRoute(
                                          builder: (context) => ScreenHome()),
                                      (route) => false);
                                }
                              }
                              setState(() {
                                IsLoading = false;
                              });

                              Map<String, dynamic> data = {
                                'email': emailController.text,
                                'name': nameController.text,
                                'uid': FirebaseAuth.instance.currentUser!.uid
                              };

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(data);
                            },
                            child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
