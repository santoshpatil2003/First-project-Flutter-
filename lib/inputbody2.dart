// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_app_2/transations.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_app_2/transations.dart';
// import './cotegory_page.dart';

class Inputbody2 extends StatefulWidget {
  final Function addTx;
  final List<Transations> selectedValuelist;
  const Inputbody2({this.addTx, this.selectedValuelist, Key key})
      : super(key: key);

  @override
  State<Inputbody2> createState() => _Inputbody2State();
}

class _Inputbody2State extends State<Inputbody2> {
  final addnameinput = TextEditingController();
  // final addamountinput = TextEditingController();

  void submitData() {
    final enterdcat = addnameinput.text;
    // final enterdmaxamount = double.parse(addamountinput.text);
    final dropdownselect = DateTime.now().toString().substring(11, 13) +
        DateTime.now().toString().substring(14, 16) +
        DateTime.now().toString().substring(17, 19);

    // ignore: unrelated_type_equality_checks
    if (enterdcat.isEmpty || dropdownselect.isEmpty) {
      return;
    }

    widget.addTx(
      enterdcat,
      dropdownselect,
    );

    // widget.createid(selectedValue);
    print(dropdownselect);

    Navigator.of(context).pop();
  }

  // selectedValue(List list) {
  //   // int length = transationslist.length;
  //   int id = int.parse(list[0].id);
  //   return id;
  // }

  @override
  Widget build(BuildContext context) {
    // final productsdata = Provider.of<Products>(context);
    // final selectedValue = productsdata.selectedValue;
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: size.height / 1.5,
            width: size.width,
            child: Column(
              children: [
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color.fromARGB(117, 255, 255, 255),
                                width: 1)),
                        child: TextField(
                          controller: addnameinput,
                          onSubmitted: (_) => submitData(),
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid)),
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, top: 10),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         border: Border.all(
                    //             color: const Color.fromARGB(117, 255, 255, 255),
                    //             width: 1)),
                    //     child: TextField(
                    //       controller: addamountinput,
                    //       onSubmitted: (_) => submitData(),
                    //       keyboardType: TextInputType.number,
                    //       style: const TextStyle(
                    //           fontSize: 25, color: Colors.white),
                    //       decoration: const InputDecoration(
                    //           border: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors.white,
                    //                   style: BorderStyle.solid)),
                    //           labelText: "Amount",
                    //           labelStyle: TextStyle(color: Colors.white)),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 280, top: 30),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: TextButton(
                                onPressed: () => submitData(),
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
