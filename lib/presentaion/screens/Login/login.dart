import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:shopx/Screen_home.dart';
import 'package:shopx/Services/Auth_service.dart';
import 'package:shopx/presentaion/screens/Home/home_screen.dart';
import 'package:shopx/presentaion/screens/Home/widget/appbar.dart';
import 'package:shopx/presentaion/screens/Login/SignUp.dart';
import 'package:shopx/presentaion/widgets/TextForm/textform.dart';
import 'package:shopx/presentaion/screens/My%20Adress/user_adress.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppbarTitlename(),
          SizedBox(
            height: 20,
          ),
          const Text(
            'Login or Signup',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(SighnUp());
              print("<<<<<<<<<<<<<<<");
            },
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  TextSpan(
                      text: '  Sign Up ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 189, 50, 40))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextInputfield(
            hinttext: "Enter Your Email",
            Tcontroller: emailController,
          ),
          TextInputfield(
            hinttext: "Enter Your password",
            Tcontroller: passwordController,
          ),
          SizedBox(
            height: 20,
          ),
         isLoading ? CircularProgressIndicator() : ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading =true;
                });
                if (emailController.text == " " ||
                    passwordController.text == "") {
                  Get.snackbar("All Feilds are Required !", "",
                      backgroundColor: Colors.red);
                } else {
                  User? result = await AuthService()
                      .Login(emailController.text, passwordController.text);
                  if (result != null) {
                    print("Sucsuss");
                  
                    print(result.email);
                  Get.offUntil(MaterialPageRoute(builder: (context)=>ScreenHome()), (route) => false);
                  }
                }
                setState(() {
                  isLoading =false;
                });
              },
              child: Text("LOGIN")),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                child: Divider(
                  endIndent: 10,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Text(
                "or",
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Divider(
                  indent: 10,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),


         isLoading? CircularProgressIndicator() : SignInButton(Buttons.Google,text: "Continue with Google" ,onPressed: ()async{
          setState(() {
            isLoading =true;
          });
            await AuthService().SignwithGoogle();
             Get.offUntil(MaterialPageRoute(builder: (context)=>ScreenHome()), (route) => false);
            setState(() {
              isLoading =false;
            });


          },),
 
        ],
      ),
    );
  }
}
