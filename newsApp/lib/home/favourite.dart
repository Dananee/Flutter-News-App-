import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsApp/constante/image_url.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List imagesList = [
    ImageUrl.castle,
    ImageUrl.desert,
    ImageUrl.forest,
    ImageUrl.snowMountain,
    ImageUrl.train,
  ];

  List colorList = [
    Colors.deepPurple,
    Colors.redAccent,
    Colors.teal,
    Colors.deepOrange,
    Colors.blueAccent
  ];

  Random random = Random();

  String imageRandom() {
    return imagesList[random.nextInt(imagesList.length)];
  }

  Color colorRandom() {
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  _authorRow(),
                  SizedBox(
                    height: 16,
                  ),
                  _newsRow(),
                ],
              ));
        },
        itemCount: 20,
      ),
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                width: 45,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageRandom()),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Abdjalil Danane",
                  style: TextStyle(color: Colors.grey[800], fontSize: 20.0),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "15 Min  ",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      ".LifeStyle",
                      style: TextStyle(
                        color: colorRandom(),
                        fontSize: 16.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.grey[600],
            size: 25.0,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _newsRow() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, left: 8, bottom: 10),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageRandom()), fit: BoxFit.cover)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Meknes: Is On Fire Medina city marjan",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Meknes city is Beautiful City In Morocco I has Greate View And Historical Monument",
                style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.25,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
