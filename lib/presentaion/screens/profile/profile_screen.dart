import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Controller/iamgepicker_controller.dart';
import 'package:shopx/Services/Auth_service.dart';
import 'package:shopx/functions/function.dart';
import 'package:shopx/presentaion/screens/Login/login.dart';
import 'package:shopx/presentaion/screens/My%20Adress/Adress_screen.dart';
import 'package:shopx/presentaion/screens/Order/Order_Screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen(
      {Key? key,
      this.name,
      this.phoneno,
      this.picode,
      this.city,
      this.state,
      this.locality,
      this.building,
      this.landmark,
      this.payPrice})
      : super(key: key);

  final String? name;
  final String? phoneno;
  final String? picode;
  final String? city;

  final String? state;
  final String? locality;
  final String? building;
  final String? landmark;
  final String? payPrice;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

var _image;

final picImageController controller = Get.put(picImageController());

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  DocumentSnapshot<Map<String, dynamic>>? userData;

  @override
  void initState() {
    print("++++++++++++++++++++++++++++++");
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((userData) {
      setState(() {
        this.userData = userData;
      });
    });
    print(userData);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Dialog'),
                    content: const Text('This is a dialog'),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Close",
                        ),
                        onPressed: () => Get.back(),
                      ),
                      TextButton(
                        child: const Text(
                          "Log out",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          await AuthService().SignOut();

                          Get.offUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 180,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      // CircleAvatar(
                      //   radius: 50,
                      //   backgroundImage: NetworkImage(
                      //     "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/300896355BLACK_1.jpg?v=1654498968",
                      //   ),
                      // ),

                      Stack(
                        children: [
                          Container(
                              width: 110,
                              height: 110,
                              decoration: _image == null
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/download.jpg')),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(File(_image))),
                                    )),
                          Positioned(
                            bottom: 4,
                            right: -14,
                            child: ElevatedButton(
                              onPressed: () async {
                                var imageSelct = await imageSelect();
                                setState(() {
                                _image = imageSelct;
                                });
                                // Get.back();

                                // FirebaseStorage storage =
                                //     FirebaseStorage.instance;

                                // TaskSnapshot taskSnapshot = await storage.ref("image").child().putFile(_image);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all(
                                    const CircleBorder()),
                              ),
                              child: const Icon(
                                Icons.photo_camera,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData?['name'] ?? '',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(userData?['email'] ?? ''),
                          SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   "9809706617",
                          //   style: TextStyle(
                          //       fontSize: 15, fontWeight: FontWeight.w800),
                          // ),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {
                    Get.to(OrderScreen(
                        name: "",
                        phoneno: "",
                        picode: "",
                        city: "",
                        state: "",
                        locality: "",
                        building: "",
                        landmark: "",
                        payPrice: ""));
                  },
                  title: Text(
                    "Orders",
                  ),
                  subtitle: Text("Check your order status'"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_rounded)),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    "Whishlist",
                  ),
                  subtitle: Text("Check your order status'"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_rounded)),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Get.to(AdressScreen(
                      price: "",
                    ));
                  },
                  title: Text(
                    "Adress",
                  ),
                  subtitle: Text("Check your order status'"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_rounded)),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    "Terms & Conditions",
                  ),
                  subtitle: Text("Check your order status'"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_rounded)),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
