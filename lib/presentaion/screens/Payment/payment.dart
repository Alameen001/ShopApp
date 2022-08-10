import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopx/presentaion/screens/Order/Order_Screen.dart';

class PaymentScreen extends StatefulWidget {
  String? user;
  PaymentScreen({Key? key, this.user, required this.payPrice, required this.name, required this.phoneno, required this.picode, required this.city, required this.state, required this.locality, required this.building, required this.landmark}) : super(key: key);
  

    final String name;
  final String phoneno;
    final String picode;
  final String city;

  final String state;
  final String locality;
    final String building;
  final String landmark;



  final String payPrice;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String payment_method = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "PAYMENT  ",
        style: TextStyle(color: Colors.black),
      )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "PAYMENT OPTIONS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20),
                  RadioListTile(
                    value: "Cash On Delivery",
                    groupValue: payment_method,
                    onChanged: (value) {
                      setState(() {
                        payment_method = value.toString();
                      });
                    },
                    title: const Text('Cash on Delivery'),
                  ),
                  RadioListTile(
                    value: 'Bhim UPI',
                    groupValue: payment_method,
                    onChanged: (value) {
                      setState(() {
                        payment_method = value.toString();
                      });
                    },
                    title: const Text('Bhim UPI'),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PRICE DETAILS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Product Price"),
                          

                          Text("₹ ${widget.payPrice}"),
                         
                        
                        ],
                        
                      ),
                      
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Delivery Charge",style: TextStyle(fontSize: 16)),
                          Text("Delivery Free",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 4,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 246, 244, 244),
            height: 55,
            child: Center(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Text(
                        "₹ ${widget.payPrice} ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(OrderScreen(name: widget.name, phoneno:widget.phoneno, picode:widget.picode, city:widget.city, state:widget. state, locality:widget.locality, building:widget. building, landmark:widget. landmark, payPrice: widget.payPrice.toString(),));
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 25)),
                        child: const Text('PAY NOW',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
