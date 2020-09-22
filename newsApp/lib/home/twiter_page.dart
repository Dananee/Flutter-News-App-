import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsApp/constante/image_url.dart';

class TwiterPage extends StatefulWidget {
  TwiterPage({Key key}) : super(key: key);

  @override
  _TwiterPageState createState() => _TwiterPageState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _TwiterPageState extends State<TwiterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Twitter"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 8.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  headCard(),
                  SizedBox(
                    height: 20,
                  ),
                  bodyCard(),
                  divider(),
                  footerCard(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Divider(
        color: Colors.grey[400],
        thickness: .5,
        height: 1,
      ),
    );
  }

  Widget headCard() {
    return Row(
      children: [
        Container(
          margin:
              EdgeInsets.only(right: 10.0, top: 8.0, left: 8.0, bottom: 8.0),
          height: 45,
          width: 45,
          child: CircleAvatar(
            backgroundImage: NetworkImage(ImageUrl.train),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Abdjalil Danane",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(" @golden_art")
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text("Fri,12 May 2017 .14:24",
                style: TextStyle(color: Colors.grey[600], fontSize: 12))
          ],
        ),
      ],
    );
  }

  Widget bodyCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
          child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy Lorem Ipsum has been the industry's standard dummy ndustry. Lorem Ipsum has been the industry's standard dummy Lorem Ipsum has been the industry's standard dummy",
        style: TextStyle(fontSize: 17, height: 1.25),
      )),
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
                IconButton(
                  icon: Icon(Icons.repeat),
                  color: Colors.orange,
                  onPressed: () {
                    print("object");
                  },
                ),
                Text("28",
                    style: TextStyle(fontSize: 14, color: Colors.grey[400])),
              ],
            ),
            Row(
              children: [
                FlatButton(
                    onPressed: () {
                      print("share");
                    },
                    child: Text("Share",
                        style: TextStyle(fontSize: 15, color: Colors.orange))),
                FlatButton(
                    onPressed: () {
                      print("open");
                    },
                    child: Text("Open",
                        style: TextStyle(fontSize: 15, color: Colors.orange))),
              ],
            ),
          ],
        ));
  }
}
