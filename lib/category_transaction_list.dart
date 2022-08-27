import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/transaction_list2.dart';
import './inputbody.dart';
import './transations.dart';

class CategorytransactionUI extends StatefulWidget {
  // static const routepage = "/transactionpage_UI";
  const CategorytransactionUI({Key key}) : super(key: key);

  @override
  State<CategorytransactionUI> createState() => _CategorytransactionUIState();
}

class _CategorytransactionUIState extends State<CategorytransactionUI> {
  void inputdata(BuildContext ctx, Function addtrans) {
    showModalBottomSheet(
        context: ctx,
        backgroundColor: const Color.fromRGBO(61, 71, 80, 100),
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Inputbody(addTx: addtrans),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products2 = productsdata.transationslist2;
    final addtransaction2 = productsdata.addtransaction2;
    // final selectedValue = productsdata.selectedValue;
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
                            inputdata(context, addtransaction2);
                          },
                          icon: const Icon(Icons.add)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, bottom: 10),
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
                                  "Transactions",
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
              TransactionList2(
                transations: products2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
