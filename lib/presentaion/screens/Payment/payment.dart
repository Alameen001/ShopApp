import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopx/presentaion/screens/Home/home_screen.dart';

import 'package:shopx/presentaion/screens/Order/Order_Screen.dart';
import 'package:shopx/presentaion/screens/Payment/Widgets/payment_success.dart';

class PaymentScreen extends StatefulWidget {
  String? user;
  PaymentScreen(
      {Key? key,
      this.user,
      required this.payPrice,
      required this.name,
      required this.phoneno,
      required this.picode,
      required this.city,
      required this.state,
      required this.locality,
      required this.building,
      required this.productId,
      required this.cartId,
      required this.productStocks,
      required this.landmark})
      : super(key: key);

  final String name;
  final String phoneno;
  final String picode;
  final String city;
  final List<String> productId;
  final List<String> cartId;
  final List<String> productStocks;
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

  late Razorpay razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_nbdQn9DkEq9dDK',
      'amount': 
     num.parse(widget.payPrice)*100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'externals': {
        'wallet': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlePaymentSuccess() {
    print("payment Success");
  }

  void handlePaymentError() {
    print("payment error");
  }

  void handleExternalWallet() {
    print("payment Success");
  }

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
                          Text("Delivery Charge",
                              style: TextStyle(fontSize: 16)),
                          Text(
                            "Delivery Free",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
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
                        onPressed: payment_method.isEmpty
                            ? null
                            : () {
                                payNowMethod();
                                // Get.to(OrderScreen(
                                //   name: widget.name,
                                //   phoneno: widget.phoneno,
                                //   picode: widget.picode,
                                //   city: widget.city,
                                //   state: widget.state,
                                //   locality: widget.locality,
                                //   building: widget.building,
                                //   landmark: widget.landmark,
                                //   payPrice: widget.payPrice.toString(),
                                // ));
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

  payNowMethod() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = FirebaseAuth.instance.currentUser!.uid;

    if (payment_method == 'Cash On Delivery') {
      Get.to(PaymentSuccess());
      for (int i = 0; i < widget.productId.length; i++) {
        firestore.collection("Orders").add(
          {
            "productId": widget.productId[i],
            "userId": userId,
            "address": {
              "name": widget.name,
              "phone": widget.phoneno,
              "pincode": widget.picode,
              "city": widget.city,
              "state": widget.state,
            }
          },
        );

        List<int> parseproductStocks =
            widget.productStocks.map((e) => int.parse(e)).toList();

        int count = parseproductStocks[i] - 1;

        firestore
            .collection("products")
            .doc(widget.productId[i])
            .update({"count": count.toString()});

        firestore.collection("cart").doc(widget.cartId[i]).delete();
      }
    }
    if (payment_method == 'Bhim UPI') {
      openCheckout();
       Get.to(PaymentSuccess());
        for (int i = 0; i < widget.productId.length; i++) {
        firestore.collection("Orders").add(
          {
            "productId": widget.productId[i],
            "userId": userId,
            "address": {
              "name": widget.name,
              "phone": widget.phoneno,
              "pincode": widget.picode,
              "city": widget.city,
              "state": widget.state,
            }
          },
        );

        List<int> parseproductStocks =
            widget.productStocks.map((e) => int.parse(e)).toList();

        int count = parseproductStocks[i] - 1;

        firestore
            .collection("products")
            .doc(widget.productId[i])
            .update({"count": count.toString()});

        firestore.collection("cart").doc(widget.cartId[i]).delete();
      }
    }
  }
}
