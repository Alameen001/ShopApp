import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Controller/totalAmount_controller.dart';
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
                    } else {
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

                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 238, 232, 232),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
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
                                                      ),
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
                                                        snapshot.data!['name']),
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
                                                    Text(snapshot.data!['price']
                                                        .toString()),
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 250, top: 10),
                                              // child: Text(

                                              child: TextButton(
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
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('cart')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return FutureBuilder<int>(
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
                                  "₹ ${snapshot.data.toString()}",
                                  // "1200",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                );
                              });
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "View Details",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(AdressScreen(
                      price: total.toString(),
                    ));
                  },
                  child: const Text("Proceed TO Pay"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
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
