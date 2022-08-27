// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter_app_2/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './transaction_list.dart';
import 'transations.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // void insert() {
  //   for (var str in widget.list) {
  //     items[str.catt] = double.parse(str.id);
  //   }
  // }

  // Map<String, double> items = {};

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final addall = productsdata.addall();
    final products = productsdata.transationslist;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(46, 54, 65, 100),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 390, top: 10),
                    child: SizedBox(
                      height: size.height / 12,
                      width: size.width / 6,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(2, 2),
                              )
                            ],
                            color: const Color.fromRGBO(61, 71, 80, 100),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    child: Text(
                      "HI Santosh",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      "Total Account Spent" +
                          " " +
                          addall.toString() +
                          " " +
                          "Rs",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 109, 101, 101),
                          fontSize: 27),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        height: size.height / 2.15,
                        width: size.width / 1.01,
                        color: const Color.fromRGBO(61, 71, 80, 100),
                        child: PieChart1(
                          list: products,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 5),
                    child: Container(
                      height: size.height / 250,
                      width: size.width / 3,
                      color: const Color.fromRGBO(100, 110, 119, 100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                    child: SizedBox(
                      child: const Center(
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              color: Color.fromRGBO(100, 110, 119, 100),
                              fontSize: 25),
                        ),
                      ),
                      height: size.height / 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 0),
                    child: Container(
                      height: size.height / 250,
                      width: size.width / 3.1,
                      color: const Color.fromRGBO(100, 110, 119, 100),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TransactionList(
                    transations: products,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
