import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsApp/constante/image_url.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List imagesList = [
    ImageUrl.castle,
    ImageUrl.desert,
    ImageUrl.forest,
    ImageUrl.snowMountain,
    ImageUrl.train,
  ];

  Random random = Random();

  String imageRandom() {
    return imagesList[random.nextInt(imagesList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(child: _singleStorie());
        });
  }

  Widget _singleStorie() {
    String url = imageRandom();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            height: 120.0,
            width: 140.0,
            child: Image(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "The Mountain Of Europe The Mountain Of Europe",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "Abdjalil Danane",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 60.0,
                      ),
                    ),
                    Icon(
                      Icons.access_time,
                      color: Colors.grey.shade700,
                      size: 10.0,
                    ),
                    Text(
                      "15:30",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
