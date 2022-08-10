import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PosterImg extends StatelessWidget {
  const PosterImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("Bannerposter").snapshots(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          DocumentSnapshot data = snapshot.data!.docs[0];
          return Container(
            height: 360,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                       data['image']),
                    fit: BoxFit.cover)),
          );
        });
  }
}
