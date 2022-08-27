// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transations.dart';

class Button2 extends StatefulWidget {
  const Button2(
      {this.cat, this.maxamount, this.id, this.date, this.index, Key key})
      : super(key: key);

  final String cat;
  final double maxamount;
  final String id;
  final String date;
  final int index;

  @override
  // ignore: no_logic_in_create_state
  State<Button2> createState() =>
      // ignore: no_logic_in_create_state
      _Button2State(this.cat, this.maxamount, this.id, this.date, this.index);
}

class _Button2State extends State<Button2> {
  final String cat;
  final double maxamount;
  final String id;
  final String date;
  final int index;

  _Button2State(this.cat, this.maxamount, this.id, this.date, this.index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final productsdata1 = Provider.of<Products>(context, listen: false);
    // final remove2 = productsdata1.remove2(id);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Dismissible(
        key: ValueKey(index),
        background: Container(
          color: Colors.cyan,
          child: const Icon(
            Icons.delete_forever,
            color: Colors.red,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 10),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          Provider.of<Products>(context, listen: false).remove2(index);
        },
        child: Container(
          height: size.height / 12,
          width: size.width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(61, 71, 80, 100),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(2, 2),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Container(
                        child: const Icon(
                          Icons.shopping_cart_rounded,
                          size: 35,
                          color: Colors.cyan,
                        ),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(61, 71, 80, 100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(2, 2),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 10, top: 10),
                            child: SizedBox(
                              child: Text(
                                cat,
                                style: const TextStyle(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 10, top: 2),
                            child: SizedBox(
                              child: Text(
                                date,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(174, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: SizedBox(
                      child: Text(
                        maxamount.toString() + " " + "Rs",
                        style: const TextStyle(
                            fontSize: 30.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
