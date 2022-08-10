import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopx/Models/Adress.dart';
import 'package:shopx/presentaion/screens/My%20Adress/user_adress.dart';
import 'package:shopx/presentaion/screens/Payment/payment.dart';

class AdressScreen extends StatelessWidget {
  AdressScreen({Key? key, required this.price}) : super(key: key);

  final String price;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "My Adress",
                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('address')
                          .where('userID',
                              isEqualTo: firebaseAuth.currentUser!.uid)
                          .snapshots(),
                      builder: (
                        context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot,
                      ) {
                        if (snapshot.hasData) {
                          // print(snapshot.data.docs.length);
                          if (snapshot.data!.docs.length > 0) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                // DocumentSnapshot data =
                                //     snapshot.data!.docs[index];
                                AdressModel adress = AdressModel.fromJson(
                                    snapshot.data!.docs[index].data());
                                print(firebaseAuth.currentUser!.uid);
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(PaymentScreen(
                                        payPrice: price,
                                        name: adress.name,
                                        phoneno: adress.phoneno,
                                        picode: adress.pincode,
                                        city: adress.city,
                                        state: adress.state,
                                        locality: adress.loacality,
                                        building: adress.buildingnmae,
                                        landmark: adress.landmark));
                                  },
                                  child: Card(
                                    color: Color.fromARGB(255, 238, 232, 232),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(adress.name),

                                          // Text(adress.pincode),
                                          Text(adress.city),
                                          Text(adress.pincode),
                                          Text(adress.state),
                                          Text(adress.loacality),
                                          Text(adress.buildingnmae),

                                          Text(adress.landmark),
                                          Text("Phone No : ${adress.phoneno}"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 120,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text("Edit"),
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18))),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black)),
                                                  )),
                                              SizedBox(
                                                  width: 120,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text("Remove"),
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18))),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black)),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Text("No Adress Available"),
                            );
                          }
                        }
                        return SizedBox();
                      }),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {
              Get.to(UserAdressScreen());
            },
            child: Text("Add Adresss"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          ),
        ),
      ),
    );
  }
}
