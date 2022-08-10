import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/presentaion/screens/product_Details/product_detailed_screen.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key, required this.category}) : super(key: key);
  final String category;

  List<String> ProductlistItems = [
    "https://media.istockphoto.com/vectors/colorful-shopping-bags-logo-design-vector-vector-id1254737904?b=1&k=20&m=1254737904&s=612x612&w=0&h=hcZyYkeBcDllIrUKwjrXe0mfBYCGggeR4LliaXQdtLE=",
    "https://getketchadmin.getketch.com/product/8905404323248/660/KHSH000336_2.jpg",
    "https://rukminim1.flixcart.com/image/714/857/k6mibgw0/t-shirt/n/z/a/m-a2-ausk-original-imafpfyyyayuxga3.jpeg?q=50",
    "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/300896355BLACK_1.jpg?v=1654498968",
    "https://lp2.hm.com/hmgoepprod?set=source[/f9/55/f9551db98c64287d851ed7206750f24cc7a5cdba.jpg],origin[dam],category[],type[LOOKBOOK],res[z],hmver[1]&call=url[file:/product/main]",
    "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0039_d225b4e7-4fd2-44be-a371-5f173c86ce91.jpg?v=1634171243",
    "https://cdn.shopify.com/s/files/1/0584/3471/5799/products/Mr.Button31800_400x.jpg?v=1631964700",
  ];
  List<String> Productitle = [
    "Louis Philippe",
    "Peter Englend",
    "Levis",
    "Benitton",
    "US Polo",
    "AllenSolly",
  ];
  List<String> ProductDiscription = [
    "Checked Shirt With patch pocket",
    "Checked Shirt With patch pocket",
    "Checked Shirt With patch pocket",
    "Checked Shirt With patch pocket",
    "Checked Shirt With patch pocket",
    "Checked Shirt With patch pocket",
  ];
  List<String> Productrate = [
    "1999/-",
    "2999/-",
    '599/-',
    "699/-",
    "3499/-",
    "799/-",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            // backgroundColor: Colors.amber,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                category,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),

              // titlePadding: EdgeInsetsDirectional.only(
              //   start: 25,
              //   bottom: 10
              // ),
            ),
            // leading: IconButton(onPressed: (){}, icon: Icon(Icons.abc)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where('category', isEqualTo: category)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.0 / 1.8
                            //childAspectRatio: 3 / 4.4,
                            ),
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ProductDetail(description: data['description'], count: data['count'], size: data['size'], name: data['name'], price: data['price'], image: data['image'], id: data.id,));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      height: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              data['image'],
                                            )),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.favorite_outline_outlined))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data['name'],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "₹ ${data['price']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          );
                        });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
