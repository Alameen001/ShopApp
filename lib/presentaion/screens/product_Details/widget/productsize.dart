import 'package:flutter/material.dart';

class ProductSizeCOntainer extends StatelessWidget {
 ProductSizeCOntainer({ Key? key,required this.productSize }) : super(key: key);

  String productSize;

  @override
  Widget build(BuildContext context) {
 return CircleAvatar(
  backgroundColor: Colors.grey,
  child: Text(productSize,style: TextStyle(color: Colors.black  ),),
 );
  }
}