import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AppbarTitlename(){
  
  return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Shop",style: TextStyle( color: Color.fromARGB(255, 243, 19, 3),fontSize: 22,fontWeight: FontWeight.bold),),
      SizedBox(width: 5,),
        Text("X",style: TextStyle( color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
    ],
  );
}