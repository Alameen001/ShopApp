import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future InsertAddress(
      String name,
      String phoneno,
      String pincode,
      String city,
      String state,
      String loacality,
      String buildingnmae,
      String landmark,
      String userID) async {
    try {
      await firestore.collection('address').doc().set({
        "name": name,
        "phoneno": phoneno,
        "pin": pincode,
        "city": city,
        "state": state,
        "loacality": loacality,
        "buildingnmae": buildingnmae,
        "landmark": landmark,
        "userID": userID,
        "date": DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
