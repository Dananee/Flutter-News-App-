import 'package:flutter/material.dart';
import 'package:newsApp/screens/homepage.dart';
import 'package:newsApp/screens/pageview.dart';
import 'constante/constantes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget starter;
  if (seen == null || seen == false) {
    starter = OnBoarding();
  } else {
    starter = HomePage();
  }

  runApp(NewsApp(starter));
}

class NewsApp extends StatelessWidget {
  Widget _starter;

  NewsApp(this._starter);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: _starter,
    );
  }
}
