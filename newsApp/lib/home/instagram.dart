import 'package:flutter/material.dart';
import 'package:newsApp/constante/image_url.dart';

class InstgramPage extends StatefulWidget {
  @override
  _InstgramPageState createState() => _InstgramPageState();
}

class _InstgramPageState extends State<InstgramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Instagram"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(bottom: 8.0),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headCard(),
                  bodyCard(),
                  contentCard(),
                  footerCard(),
                ],
              ),
            );
          }),
    );
  }

  Widget headCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(ImageUrl.forest),
                radius: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Abdjalil Danane",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text("Mon,21.2020 .19:21",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  print("LOve It");
                }),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text("34",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ),
          ],
        )
      ],
    );
  }

  Widget bodyCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 8.0),
      child: Column(
        children: [
          Text(
            "I Love Traveling is More ",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 1.0,
          ),
          Text(
            "#travel #europe #train ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget contentCard() {
    return Container(
      height: MediaQuery.of(context).size.height * .35,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ImageUrl.train), fit: BoxFit.cover)),
    );
  }

  Widget footerCard() {
    return Padding(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FlatButton(
                  onPressed: () {
                    print("comments");
                  },
                  child: Text(
                    "COMMENTS",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                Text("28",
                    style: TextStyle(fontSize: 15, color: Colors.grey[400])),
              ],
            ),
            Row(
              children: [
                FlatButton(
                    onPressed: () {
                      print("SHARE");
                    },
                    child: Text("SHARE",
                        style: TextStyle(fontSize: 15, color: Colors.orange))),
                FlatButton(
                    onPressed: () {
                      print("open");
                    },
                    child: Text("OPEN",
                        style: TextStyle(fontSize: 15, color: Colors.orange))),
              ],
            ),
          ],
        ));
  }
}
