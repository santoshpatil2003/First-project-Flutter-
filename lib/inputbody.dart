import 'package:flutter/material.dart';
import 'package:flutter_app_2/transations.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_app_2/transations.dart';
// import './cotegory_page.dart';

class Inputbody extends StatefulWidget {
  final Function addTx;
  final List<Transations> selectedValuelist;
  const Inputbody({this.addTx, this.selectedValuelist, Key key})
      : super(key: key);

  @override
  State<Inputbody> createState() => _InputbodyState();
}

class _InputbodyState extends State<Inputbody> {
  final addnameinput = TextEditingController();
  final addamountinput = TextEditingController();
  final dateController = TextEditingController();

  void submitData(List list) {
    final enterdcat = addnameinput.text;
    final enterdmaxamount = double.parse(addamountinput.text);
    final dropdownselect2 = selectedValue2.toString();
    final date = dateController.text;
    final datetime = date.toString().substring(0, 10);
    // ignore: unrelated_type_equality_checks
    if (enterdcat.isEmpty ||
        enterdmaxamount <= 0 ||
        dropdownselect2.isEmpty ||
        datetime.isEmpty) {
      return;
    }

    widget.addTx(
      enterdcat,
      enterdmaxamount,
      dropdownselect2,
      datetime,
    );

    Navigator.of(context).pop();
  }

  // selectedValue(List list) {
  //   // int length = transationslist.length;
  //   int id = int.parse(list[0].id);
  //   return id;
  // }

  int selectedValue2 = 1;

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final category = productsdata.transationscatlist;
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
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: TextField(
                        controller: addnameinput,
                        onSubmitted: (_) => submitData(category),
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        controller: addamountinput,
                        onSubmitted: (_) => submitData(category),
                        keyboardType: TextInputType.number,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            labelText: "Amount",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        height: size.height / 14,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 0),
                          child: TextField(
                            readOnly: true,
                            controller: dateController,
                            decoration: const InputDecoration(
                                hintText: 'Pick your Date',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              dateController.text = DateFormat.yMd(date)
                                  .toString()
                                  .substring(0, 10);

                              (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData(
                                    primaryColor: Colors.white,
                                    buttonTheme: const ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary),
                                  ),
                                  child: child,
                                );
                              };
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color.fromARGB(117, 255, 255, 255),
                                width: 1)),
                        width: size.width / 1,
                        height: size.height / 14,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, top: 0),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                  dropdownColor:
                                      const Color.fromRGBO(61, 71, 80, 100),
                                  isExpanded: true,
                                  itemHeight: size.height / 19,
                                  value: selectedValue2,
                                  items: category
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.catt,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 27),
                                            ),
                                            value: int.parse(e.id),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 280, top: 30),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: TextButton(
                          onPressed: () => submitData(category),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
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
