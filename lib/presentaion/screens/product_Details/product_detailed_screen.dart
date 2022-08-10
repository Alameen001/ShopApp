import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:shopx/presentaion/screens/My%20Adress/Adress_screen.dart';

import 'package:shopx/presentaion/screens/My%20Adress/user_adress.dart';
import 'package:shopx/presentaion/screens/cart/cart.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(
      {Key? key,
      required this.description,
      required this.count,
      required this.size,
      required this.price,
      required this.name,
      required this.image,
      required this.id})
      : super(key: key);
  final String description;
  final String count;
  final String size;
  final String name;
  final int price;
  final String image;
  final String id;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> sizeList = [
    "S",
    "M",
    "L",
    "XL",
  ];
  int sizeTappedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 130,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Product Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('cart').add({
                        'productId': widget.id,
                        'userId': FirebaseAuth.instance.currentUser!.uid,
                      });
                      Get.to(CartScreen());
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ))
              ],
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Stack(
                        children: [
                          Image.network(
                            // "https://rukminim1.flixcart.com/image/714/857/k6mibgw0/t-shirt/n/z/a/m-a2-ausk-original-imafpfyyyayuxga3.jpeg?q=50",
                            widget.image,
                            fit: BoxFit.cover,
                            height: 430,
                            width: 320,
                          ),
                          Positioned(
                            bottom: 11,
                            left: 150,
                            child: Container(
                              height: 3.5,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // height: 450,
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                        color: Colors.black,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Description",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 160,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Center(
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    //                         """
                                    // Mid-rise jeans made of rigid fabric with five
                                    // pockets. Ripped details Front zip tly and
                                    // metal top button fastening.""",
                                    widget.description,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  // ' 1299',
                                  "₹ ${widget.price.toString()}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Stock : ${widget.count}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),

                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       height: 30,
                                //       width: 30,
                                //       child: ListView.separated(
                                //           itemBuilder: (context, index) {
                                //             return GestureDetector(
                                //               onTap: () {
                                //                 setState(() {
                                //                   tappedIndex = index;
                                //                 });
                                //                 print(tappedIndex);

                                //               },
                                //               child: SizeItemMethod(
                                //                   size: sizeList[tappedIndex],
                                //                   color: tappedIndex == index
                                //                       ? Color(0xffF4DCB0)
                                //                       : Colors.amber),
                                //             );
                                //           },
                                //           separatorBuilder: (context, index) {
                                //             return SizedBox(
                                //               width: 10,
                                //             );
                                //           },
                                //           itemCount: 4),
                                //     )
                                //   ],
                                // ),

                                SizedBox(
                                  // width: 200,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 30,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sizeList.length,
                                    itemBuilder: (context, sizeIndex) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            sizeTappedIndex = sizeIndex;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color:
                                                  sizeTappedIndex == sizeIndex
                                                      ? Color(0xffF4DCB0)
                                                      : Colors.white),
                                          child: Center(
                                            child: Text(
                                              sizeList[sizeIndex],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, _) {
                                      return SizedBox(width: 25);
                                    },
                                  ),
                                ),
                              ]),
                              SizedBox(height: 25),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffF4DCB0)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Color(0xffF4DCB0),
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          // FirebaseFirestore.instance
                                          //     .collection('products')
                                          //     .doc(widget.id)
                                          //     .update({
                                          //       "count" :widget.count
                                          //     });

                                          Get.to(AdressScreen(price: widget.price.toString(),));
                                        },
                                        icon: Icon(
                                          CupertinoIcons.bag,
                                          color: Colors.black,
                                        ),
                                        label: Text(
                                          "BUY NOW",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Color(0xffF4DCB0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//
//
//
//
//<<<<<<<<<<<<<<<<<<<<<<<<<Method>>>>>>>>>>>>>>>>>>>>>>>>>//
  SizeItemMethod({
    required String size,
    required color,
  }) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(
        size,
        style: TextStyle(
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
