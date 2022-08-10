import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FashionModels extends StatelessWidget {
  FashionModels({Key? key}) : super(key: key);

  // List<String> Fmodels = [
  //   "https://assets.ajio.com/cms/AJIO/WEB/03062022-18-leecooper.jpg",
  //   "https://assets.ajio.com/cms/AJIO/WEB/03062022-18-altheory.jpg",
  //   "https://assets.ajio.com/cms/AJIO/WEB/03062022-18-dnmx.jpg",
  //   "https://assets.ajio.com/cms/AJIO/WEB/03062022-18-ts.jpg",
  //   "https://assets.ajio.com/cms/AJIO/WEB/03062022-18-johnplayers.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "THE HIGH ROAD TO FASHION",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 350,
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('poster').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(data['image']),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
