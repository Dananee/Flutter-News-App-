import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:newsApp/constante/image_url.dart';

class WhatNew extends StatefulWidget {
  @override
  _WhatNewState createState() => _WhatNewState();
}

class _WhatNewState extends State<WhatNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          _drawStories(),
          _drawTitle("Recent Stories"),
          _drawRecentCard(Colors.deepOrange, "The Mountain of Calemengro",
              "Sport", ImageUrl.desert),
          SizedBox(
            height: 20.0,
          ),
          _drawRecentCard(
              Colors.teal, "The Shara Desert", "Travel", ImageUrl.snowMountain),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _titleStyle = TextStyle(
        color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold);
    TextStyle _descriptionStyle = TextStyle(color: Colors.white, fontSize: 25);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .30,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ImageUrl.snowMountain), fit: BoxFit.cover)),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: .75, sigmaY: .75),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Atlas Mountain",
                  style: _titleStyle,
                ),
                Text("is montain in africa \n exacly in Morocoo",
                    style: _descriptionStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawTitle("Top Stories"),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _singleStorie(ImageUrl.forest),
                  divider(),
                  _singleStorie(ImageUrl.castle),
                  divider(),
                  _singleStorie(ImageUrl.train),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Colors.grey.shade200,
      thickness: 2,
      height: 1,
    );
  }

  Widget _singleStorie(String url) {
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

  Widget _drawRecentCard(
      Color color, String title, String stick, String urlImage) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(urlImage), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 16, bottom: 8),
            child: Container(
              padding: EdgeInsets.only(top: 2, bottom: 2, left: 24, right: 24),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(4)),
              child: Text(
                stick,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 8, left: 16),
            child: Text(title,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
            ),
          ),
        ]));
  }

  Widget _drawTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, bottom: 16),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
