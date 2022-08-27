// ignore_for_file: unused_import
import 'package:flutter_app_2/date.dart';

import 'category_transaction_list.dart';
import 'transations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/cotegory_page.dart';
import 'package:flutter_app_2/homepage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'transactionpage_UI.dart';
import 'cotegory_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int currentindex = 0;
  List screens = const [
    Homepage(),
    Categorys(),
    CategorytransactionUI(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromRGBO(46, 54, 65, 100),
          bottomNavigationBar: Container(
            color: const Color.fromRGBO(61, 71, 80, 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: GNav(
                  backgroundColor: const Color.fromRGBO(46, 54, 65, 100),
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.cyan,
                  padding: const EdgeInsets.all(10),
                  gap: 8,
                  iconSize: 40,
                  onTabChange: (index) => setState(() {
                        currentindex = index;
                      }),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: "Home",
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    GButton(
                      icon: Icons.category_outlined,
                      text: "Category",
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    GButton(
                      icon: Icons.money_rounded,
                      text: "Transactions",
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
          body: screens[currentindex],
        ),
        routes: {TransactionUI.routepage: (context) => const TransactionUI()},
      ),
    );
  }
}
