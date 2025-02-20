import 'package:firebase_analytices/presenations/screens/bnb/business_page.dart';
import 'package:firebase_analytices/presenations/screens/bnb/homepage.dart';
import 'package:firebase_analytices/presenations/screens/bnb/profile_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({Key? key}) : super(key: key);

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {
  int selectedIndex = 0;
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  static List pageNames = ["Homepage", "BusinessPage", "ProfilePage"];

  static const List<Widget> widgetOptions = <Widget>[
    Homepage(),
    BusinessPage(),
    ProfilePage()
  ];
  @override
  void initState() {
    firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Analytics"),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: (value) async{
          await firebaseAnalytics.logEvent(
            name:"Pages_tracked",
            parameters:  {
              "page_names":pageNames[value],
              "page_index":value
            });
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
