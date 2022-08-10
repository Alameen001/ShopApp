import 'package:flutter/material.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Whishlist",style: TextStyle(color: Colors.black),
        ),centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end,
     
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/WhatsApp_Image_2022-07-07_at_5.16.35_PM-removebg-preview.png"))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Your wishlist is empty ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Hang your wishes where you can make them come true.",
            style: TextStyle(color: Color.fromARGB(255, 100, 92, 92)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Continue Shopping",
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                 
                ),
              ),
            ),
          ),
          SizedBox(height: 80,),
        ],
      ),
    );
  }
}
