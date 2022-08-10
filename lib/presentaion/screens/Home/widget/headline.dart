import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeadlineBrand extends StatelessWidget {
  const HeadlineBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SizedBox(
      height: 230,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "A NEW FASHION BRAND",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('TralingPoster').snapshots(),
              builder: (context, snapshot) {
             
                 if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
               DocumentSnapshot data = snapshot.data!.docs[0];

                return ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Size.width,
                      // height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                 data['image']),
                              fit: BoxFit.cover)),
                    );
                  },
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
