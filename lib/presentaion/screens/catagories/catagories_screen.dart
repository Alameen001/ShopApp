import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/presentaion/screens/Home/widget/product_list.dart';

class CatagoriesScreen extends StatelessWidget {
  CatagoriesScreen({Key? key}) : super(key: key);

  List<String> catogariesName = [
    'Shirts',
    'T-Shirts',
    'Shorts',
    'Jeans',
    'Track Pants',
    'Blazzers',
  ];

  List<String> categoryIMG = [
    "https://getketchadmin.getketch.com/product/8905404323248/660/KHSH000336_2.jpg",
    "https://rukminim1.flixcart.com/image/714/857/k6mibgw0/t-shirt/n/z/a/m-a2-ausk-original-imafpfyyyayuxga3.jpeg?q=50",
    "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/300896355BLACK_1.jpg?v=1654498968",
    "https://lp2.hm.com/hmgoepprod?set=source[/f9/55/f9551db98c64287d851ed7206750f24cc7a5cdba.jpg],origin[dam],category[],type[LOOKBOOK],res[z],hmver[1]&call=url[file:/product/main]",
    "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0039_d225b4e7-4fd2-44be-a371-5f173c86ce91.jpg?v=1634171243",
    "https://cdn.shopify.com/s/files/1/0584/3471/5799/products/Mr.Button31800_400x.jpg?v=1631964700",
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CATEGORY",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Category')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      Get.to(ProductList(category: data['name']));
                    },
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(data['image']),
                    ),
                    title: Text(
                      data['name'],
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
