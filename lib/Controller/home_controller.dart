

import 'package:get/get.dart';

class HomeController extends GetxController{
  

  //---BottamNavigation----///
  var currentSelectedindex =0;
  onSelectedItem(int newindex){
    currentSelectedindex = newindex;
    update();
  }



}