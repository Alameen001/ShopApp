import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CupertinoSearchTextField(
            backgroundColor:  Colors.grey.withOpacity(0.2 ),
            prefixIcon: Icon(Icons.search,
            color: Colors.black,),
            suffixIcon: Icon(  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,),
                    style: const TextStyle(color: Colors.black),
          )
        ],
      );
  }
}