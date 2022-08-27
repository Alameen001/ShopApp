import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Controller/totalAmount_controller.dart';
import 'package:shopx/Models/product_model.dart';
import 'package:shopx/presentaion/screens/My%20Adress/Adress_screen.dart';
import 'package:shopx/presentaion/screens/My%20Adress/user_adress.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TotalAmountC totalAmountC = Get.put(TotalAmountC());
  // final String name;
  var total = 0;
  List<String> prouctStocks = [];

  ///Dropdwon Count///
  ///
  ///
                int count = 0;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Shopping CartBag",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 38,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "1 ITEMS SELECTED (807)",
                        style: TextStyle(color: Colors.black),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
                // CartItems(),
                StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('cart').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          print(snapshot.data!.docs[index]['productId']);

                          return StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('products')
                                  .doc(data['productId'])
                                  .snapshots(),
                              builder: (context, snapshot) {
                  
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (!snapshot.data!.exists) {
                                  return const Center(
                                    child: Text('data'),
                                  );
                                }

                                prouctStocks.add(snapshot.data!['count']);

                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 238, 232, 232),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          snapshot
                                                              .data!['image'],
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data!['name'],
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 19),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  // Text(snapshot.data!['description']),
                                                  // Row(
                                                  //   children: [
                                                  //     ElevatedButton.icon(
                                                  //       onPressed: () {},
                                                  //       label: Text("Size"),
                                                  //       icon: Icon(Icons.arrow_drop_down),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 10,
                                                  //     ),
                                                  //     ElevatedButton.icon(
                                                  //       onPressed: () {},
                                                  //       label: Text("Qty"),
                                                  //       icon: Icon(Icons.arrow_drop_down),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  Text(
                                                    "₹ ${snapshot.data!['price']}/-"
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  Text(
                                                    "You Save,2900.00/-",
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(
                                            thickness: 3,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  QuantityAction(
                                                      color: Colors.red,
                                                      action: '-',
                                                      onTap: () {

                                                        
                                                      
                                                        // int count=0 ;
                                                        setState(() {
                                                          quantity =
                                                              count = count - 1;
                                                        });
                                                        log('message');
                                                      }),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 3.0,
                                                            bottom: 3),
                                                    child: Text('$quantity'),
                                                  ),
                                                  QuantityAction(
                                                    color: Colors.green,
                                                    action: '+',
                                                    size: 30,
                                                    onTap: () {
                                                      // int count=0;
                                                      setState(() {
                                                        quantity =
                                                            count = count + 1;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('cart')
                                                      .doc(data.id)
                                                      .delete();
                                                  // Get.back();
                                                },
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: snapshot.data!.docs.length);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('cart').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print(snapshot.data!.docs.map((e) => e['productId']));

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<int>(
                                  future: gettotal(snapshot.data!.docs),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text(
                                        "",
                                      );
                                    }
                                    total = snapshot.data!;
                                    return Text(
                                      "₹ ${snapshot.data.toString()}/-",
                                      // "1200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    );
                                  }),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              const Text(
                                "View Details",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              print(ProductModel.products.length);
                              Get.to(AdressScreen(
                                price: total.toString(),
                                cartId: snapshot.data!.docs
                                    .map((e) => e.id)
                                    .toList(),
                                productId: snapshot.data!.docs
                                    .map((e) => e['productId'].toString())
                                    .toList(),
                                productStocks: prouctStocks,
                              ));
                            },
                            child: const Text("Proceed To Pay"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                        ),
                        // SizedBox(width: 5,)
                      ],
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

Future<DocumentSnapshot> getcart(productid) async {
  DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('products')
      .doc(productid)
      .get();
  print(doc.data().toString());

  return doc;
}

Future<int> gettotal(snapshot) async {
  int total = 0;
  print("${snapshot.length}++++++++++++++++++");
  for (int i = 0; i < snapshot.length; i++) {
    DocumentSnapshot doc = await getcart(snapshot[i]['productId']);
    total = total + int.parse(doc['price'].toString());
  }
  return total;
}

class QuantityAction extends StatelessWidget {
  final VoidCallback onTap;
  final String action;
  final Color? color;
  final double size;
  const QuantityAction({
    Key? key,
    required this.onTap,
    required this.action,
    required this.color,
    this.size = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
        ),
        Padding(
            padding: EdgeInsets.only(right: 3.0, bottom: 3),
            child: TextButton(
                onPressed: onTap,
                child: Text(
                  action,
                  style: TextStyle(color: color),
                ))),
      ],
    );
  }
}
