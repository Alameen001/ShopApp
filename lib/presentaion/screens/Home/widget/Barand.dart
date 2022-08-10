import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BarandImg extends StatelessWidget {
  BarandImg({Key? key}) : super(key: key);
  final List<String> brandName = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqRP-6jJMt1eXXajQ86N6cYRq3085INnyUnQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc4FeoO57ZKqs8Wc_pdLofd-onWZuauyAL6g&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsDwHbhtTcusUITRePOflXfYQr3Y1i8wrKxQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8PP4hYWoLNBAOZOOji4dNTqXW_jC6iTO7Eg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtvNp89nCL6ZeK4LXD06nCQPt2Qz3yf4X4Pg&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "MOST LOVED BRANDS",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CarouselSlider(
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(brandName[i - 1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              height: 200,
            ),
          ),
        )
      ],
    );
  }
}
