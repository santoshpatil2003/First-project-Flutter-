// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transations.dart';
import 'transactionpage_UI.dart';

class Button1 extends StatefulWidget {
  const Button1({this.cat, this.id, this.index, Key key}) : super(key: key);

  final String cat;
  final String id;
  final int index;
  // final double maxamount;

  @override
  // ignore: no_logic_in_create_state
  State<Button1> createState() => _Button1State(this.cat, this.id, this.index);
}

class _Button1State extends State<Button1> {
  final String cat;
  final String id;
  final int index;

  _Button1State(this.cat, this.id, this.index);

  void openscreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TransactionUI.routepage, arguments: {"id": id});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productsdata1 = Provider.of<Products>(context);
    final add = productsdata1.add1(id);
    // final remove = productsdata1.remove1(id);
    return InkWell(
      onTap: () => openscreen(context),
      child: Padding(
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
            productsdata1.remove1(index);
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 10),
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 10),
                      child: Consumer<Products>(
                        builder: (context, value, child) => SizedBox(
                          child: Text(
                            add.toString() + " " + "Rs",
                            style: const TextStyle(
                                fontSize: 30.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
