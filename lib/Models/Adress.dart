


import 'package:cloud_firestore/cloud_firestore.dart';

class AdressModel{
  // String id;
  String name; 
  String phoneno;
  String pincode; 
  String city;
   String state;
    String loacality; 
    String buildingnmae;
     String landmark;
     String userID;
     Timestamp date;
  

  AdressModel({
    // required this.id,
    required this.name,
    required this.phoneno,
    required this.pincode,
    required this.city,
    required this.state,
    required this.loacality,
    required this.buildingnmae,
    required this.landmark,
    required this.userID,
    required this.date,

  });
  // Querymap<Map<String,dynamic>>

  factory AdressModel.fromJson(Map<String,dynamic> map){
    return AdressModel(
      // id: map.id, 
    name: map['name'], 
    phoneno: map['phoneno'], 
    pincode: map['pin'],
     city: map['city'],
      state: map['state'],
       loacality: map['loacality'],
        buildingnmae: map['buildingnmae'],
         landmark: map['landmark'],
          userID: map['userID'], 
          date: map['date']);

  }


}