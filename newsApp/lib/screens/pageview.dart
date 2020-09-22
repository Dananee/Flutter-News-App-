import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  int currentIndex = 0;
  ValueNotifier _pageViewNotifier = ValueNotifier<int>(0);

  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
      'Welcome',
      '1- Making friends is easy as waving your hand back and forth in easy step',
      Icons.ac_unit,
    ));
    pages.add(PageModel(
      'Alarm',
      '2- Making friends is easy as waving your hand back and forth in easy step',
      Icons.access_alarms,
    ));
    pages.add(PageModel(
      'Print',
      '3- Making friends is easy as waving your hand back and forth in easy step',
      Icons.map,
    ));
    pages.add(PageModel(
      'Map',
      '4- Making friends is easy as waving your hand back and forth in easy step',
      Icons.ac_unit,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Stack(children: [
      Scaffold(
        body: PageView.builder(
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
            itemCount: pages.length,
            itemBuilder: (context, int index) {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1F2B2E),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                          offset: Offset(-12, -100),
                          child: Center(
                              child: Icon(
                            pages[index]._icon,
                            size: 150,
                            color: Colors.white,
                          ))),
                      Center(
                        child: Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          pages[index]._description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 175),
                        child: Align(
                          alignment: Alignment.center,
                          child: _displayPageIndicators(pages.length),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              color: Colors.red.shade900,
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              onPressed: () {
                _updateSeen();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.redAccent,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red[800],
        ),
      ),
    );
  }

  _updateSeen() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}

class PageModel {
  int index;

  String _title;
  String _description;
  IconData _icon;

  PageModel(this._title, this._description, this._icon);

  String get title => _title;
  String get description => _description;
  IconData get icon => _icon;
}
