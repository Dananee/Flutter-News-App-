import 'package:flutter/material.dart';
import 'package:newsApp/home/favourite.dart';
import 'package:newsApp/home/popular.dart';
import 'package:newsApp/home/whats_new.dart';
import 'package:newsApp/shared_ui/navigation_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 0, vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('News'),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () => null),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () => null),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text('HOME'),
                ),
                Tab(
                  child: Text('POPULAR'),
                ),
                Tab(
                  child: Text('FAVOURITE'),
                ),
              ],
              controller: _tabController,
            )),
        drawer: NavigationDrawer(),
        body: Center(
          child: TabBarView(
            children: [
              Favourite(),
              Popular(),
              Favourite(),
            ],
            controller: _tabController,
          ),
        ));
  }
}
