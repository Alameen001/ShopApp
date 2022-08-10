import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TotalAmountC extends GetxController {
  var total = 0;
  DocumentSnapshot? doc;
// final  int total;

  totalAmountFun(price) {
    total = total + int.parse(price.toString());

    update();
  }

}
