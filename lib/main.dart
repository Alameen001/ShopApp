import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Services/Auth_service.dart';
import 'package:shopx/presentaion/screens/Login/login.dart';

import 'package:shopx/presentaion/splash/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          iconTheme: IconThemeData(color: Colors.black),
          primarySwatch: Colors.blue),
      home:  StreamBuilder(
          stream: AuthService().firebaseAuth.authStateChanges(),
          builder:(context, snapshot) {
            if(snapshot.hasData){
              return SplashScreen();
            }
            return LoginScreen();
          
        }),
    );
  }
}
