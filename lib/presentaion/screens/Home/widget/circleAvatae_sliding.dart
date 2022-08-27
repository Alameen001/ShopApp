import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/presentaion/screens/Home/widget/appbar.dart';
import 'package:shopx/presentaion/screens/Home/widget/product_list.dart';

class CircleSliding extends StatelessWidget {
  CircleSliding({Key? key}) : super(key: key);

  List<String> catogariesName = [
    'Shopx ',
    'Shirts',
    'T-Shirts',
    'Shorts',
    'Jeans',
    'Track Pants',
    'Blazzers',
  ];

  List<String> slidinImages = [
    "https://media.istockphoto.com/vectors/colorful-shopping-bags-logo-design-vector-vector-id1254737904?b=1&k=20&m=1254737904&s=612x612&w=0&h=hcZyYkeBcDllIrUKwjrXe0mfBYCGggeR4LliaXQdtLE=",
    "https://getketchadmin.getketch.com/product/8905404323248/660/KHSH000336_2.jpg",
    "https://rukminim1.flixcart.com/image/714/857/k6mibgw0/t-shirt/n/z/a/m-a2-ausk-original-imafpfyyyayuxga3.jpeg?q=50",
    "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/300896355BLACK_1.jpg?v=1654498968",
    "https://lp2.hm.com/hmgoepprod?set=source[/f9/55/f9551db98c64287d851ed7206750f24cc7a5cdba.jpg],origin[dam],category[],type[LOOKBOOK],res[z],hmver[1]&call=url[file:/product/main]",
    "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0039_d225b4e7-4fd2-44be-a371-5f173c86ce91.jpg?v=1634171243",
    "https://cdn.shopify.com/s/files/1/0584/3471/5799/products/Mr.Button31800_400x.jpg?v=1631964700",
  ];

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Container(
      height: 120,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Category').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductList(
                      category: data['name'],
                    ));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        // child: CircleAvatar(
                        //   radius: 45,
                        //   backgroundImage: NetworkImage(
                            
                        //     data['image'],),
                       
                        // ),

                          child:  CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          height: size.height * .5,
                          width: size.width * .3,
                          placeholder:'assets/download.jpg' , image: data['image'],placeholderFit: BoxFit.cover,)
                      ),
                    ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['name'],
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
