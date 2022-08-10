import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/presentaion/screens/Home/widget/Barand.dart';
import 'package:shopx/presentaion/screens/Home/widget/appbar.dart';
import 'package:shopx/presentaion/screens/Home/widget/circleAvatae_sliding.dart';
import 'package:shopx/presentaion/screens/Home/widget/fashinModel.dart';
import 'package:shopx/presentaion/screens/Home/widget/headline.dart';
import 'package:shopx/presentaion/screens/Home/widget/poster_img.dart';
import 'package:shopx/presentaion/screens/Login/login.dart';
import 'package:shopx/presentaion/screens/Search/search.dart';


var scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
        drawer: Drawer(),
        appBar: PreferredSize(
          
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {
                       scaffoldKey.currentState?.openDrawer();
                    }, icon: Icon(Icons.menu)),
                    Spacer(),
                    AppbarTitlename(),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                          Get.to(LoginScreen());
                        },
                        icon: Icon(Icons.notifications_active_rounded)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ScreenSearch(),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(130),
        ),
        body:ListView(
          children: [
            CircleSliding(),
            PosterImg(),
            BarandImg(),
            FashionModels(),
            HeadlineBrand(),
          ],
        )  ,
      ),
    );
  }
}
