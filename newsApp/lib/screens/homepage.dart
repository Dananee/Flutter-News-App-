import 'package:flutter/material.dart';
import 'package:newsApp/home/favourite.dart';
import 'package:newsApp/home/popular.dart';
import 'package:newsApp/home/whats_new.dart';
import 'package:newsApp/shared_ui/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum WhyFarther { HELP, ABOUT, CONTACT, SETTINGS }

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 0, vsync: this, length: 3);
  }

  var _selection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Explore'),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () => null),
              popup(),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text('What\'s New'),
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
              WhatNew(),
              Popular(),
              Favourite(),
            ],
            controller: _tabController,
          ),
        ));
  }

  Widget popup() {
    return PopupMenuButton<WhyFarther>(
      onSelected: (WhyFarther result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.HELP,
          child: Text('Help'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.ABOUT,
          child: Text('About'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.CONTACT,
          child: Text('Contact'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.SETTINGS,
          child: Text('Settings'),
        ),
      ],
    );
  }
}
