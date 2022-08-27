import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './transations.dart';
import './transaction_list.dart';
import './inputbody2.dart';

class Categorys extends StatefulWidget {
  const Categorys({Key key}) : super(key: key);

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  void inputdata(
    BuildContext ctx,
    Function addtrans,
    List<Transations> selectedValuelist,
  ) {
    showModalBottomSheet(
        context: ctx,
        backgroundColor: const Color.fromRGBO(61, 71, 80, 100),
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Inputbody2(
              addTx: addtrans,
              selectedValuelist: selectedValuelist,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products = productsdata.transationslist;
    final addtransaction = productsdata.addtransaction;
    // final createid = productsdata.createid;
    // final selectedValue = productsdata.selectedValue();

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
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: size.height / 10,
                      width: size.width / 5,
                      child: IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          onPressed: () {
                            inputdata(
                              context,
                              addtransaction,
                              products,
                            );
                          },
                          icon: const Icon(Icons.add)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7, bottom: 10),
                    child: SizedBox(
                      child: Row(
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
                            padding: const EdgeInsets.only(
                                top: 20, left: 5, right: 5),
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
                    ),
                  ),
                ],
              ),
              TransactionList(
                transations: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
