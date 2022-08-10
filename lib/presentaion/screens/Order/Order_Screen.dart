import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key, required this.name, required this.phoneno, required this.picode, required this.city, required this.state, required this.locality, required this.building, required this.landmark, required this.payPrice}) : super(key: key);

  final String name;
  final String phoneno;
    final String picode;
  final String city;
 
  final String state;
  final String locality;
    final String building;
  final String landmark;

   final String payPrice;





  int current_step = 0;
  List<Step> Liststeps = [
    Step(
      state: StepState.indexed,
      title: Row(
        children: [
          Lottie.network(
            'https://assets10.lottiefiles.com/packages/lf20_5ngs2ksb.json',
            height: 70,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ordered",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Ordered on june 22,2022",
                style: TextStyle(
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
      content: const Text(''),
      // subtitle: Text("data"),
      isActive: true,
    ),
    Step(
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.network(
            'https://assets10.lottiefiles.com/private_files/lf30_nas75dmu.json',
            height: 50,
          ),
          // SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Shipped",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Shipped on june 22,2022",
                style: const TextStyle(
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
      content: const Text(''),
      // subtitle: Text("data"),
      isActive: true,
    ),
    Step(
      // state: StepState.complete,
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_w5oe9omf.json',
            height: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Delivered",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Your item has been deliverd",
                style: TextStyle(
                    color: Colors.grey, overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ],
      ),
      content: const Text(''),
      // subtitle: Text("data"),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order ID-RFFdsaedTRQ12D4",
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/300896355BLACK_1.jpg?v=1654498968",
                  height: 90,
                  width: 90,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shorts", style: TextStyle()),
                      SizedBox(
                        height: 10,
                      ),
                      Text("₹750", style: TextStyle()),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "1 Item",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Theme(
              data: ThemeData(colorScheme: ColorScheme.light()),
              child: Stepper(
                steps: Liststeps,
                controlsBuilder: (context, _) {
                  return Row(
                    children: [],
                  );
                },
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const Text(
              "Shippinng details",
              style: const TextStyle(fontSize: 20),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Text(
                    //   "Ameen\nCarnival Infopark,\nPhase 2,\nKakkanadu,\nPin  : 691304\nkerala,\nIndia,\nPhone number:994767656",
                    //   style: TextStyle(fontSize: 15),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(name),

                        // Text(adress.pincode),
                        Text(phoneno),
                        Text(picode),
                        Text(city),
                        Text(state),
                        Text(locality),

                        Text(building),
                        Text(landmark),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "Price Details",
              style: const TextStyle(fontSize: 20),
            ),
            const ListTile(
              leading: Text(
                "Payment method",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text("Online payment"),
            ),
            ListTile(
              leading: const Text(
                "Product price",
                style: TextStyle(fontSize: 20),
              ),
              trailing:  Text("₹${payPrice}"),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ElevatedButton(
      //       onPressed: () {

      //       },
      //       child: const Text("HELP")),
      // ),
    );
  }
}
