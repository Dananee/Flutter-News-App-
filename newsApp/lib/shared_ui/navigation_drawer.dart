import 'package:flutter/material.dart';
import 'package:newsApp/constante/nav_menu.dart';
import 'package:newsApp/home/instagram.dart';
import 'package:newsApp/home/twiter_page.dart';
import 'package:newsApp/screens/headline_news.dart';
import 'package:newsApp/screens/homepage.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    List<NavMenuItem> navMenuItem = [
      NavMenuItem(() => HomePage(), "Explore"),
      NavMenuItem(() => HeadLineNews(), "HeadLine"),
      NavMenuItem(() => TwiterPage(), "Twitter"),
      NavMenuItem(() => InstgramPage(), "Instgram"),
    ];

    // List titleDrawer = [
    //   "Explore",
    //   "Head Line",
    //   "Read Later",
    //   "Videos",
    //   "Pictures",
    //   "Settings",
    //   "Logout",
    // ];

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: ListView.builder(
            itemCount: navMenuItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey[600],
                  size: 30.0,
                ),
                title: Center(
                  child: Text(
                    navMenuItem[index].title,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return navMenuItem[index].destination();
                  }));
                },
              );
            }),
      ),
    );
  }
}
