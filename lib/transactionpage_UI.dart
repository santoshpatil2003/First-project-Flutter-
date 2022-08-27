// ignore_for_file: file_names
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/transaction_list2.dart';
import './inputbody.dart';
import './transations.dart';

class TransactionUI extends StatefulWidget {
  static const routepage = "/transactionpage_UI";
  const TransactionUI({Key key}) : super(key: key);

  @override
  State<TransactionUI> createState() => _TransactionUIState();
}

class _TransactionUIState extends State<TransactionUI> {
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
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final transactionid = routeArgs["id"];
    final productsdata = Provider.of<Products>(context);
    final products2 = productsdata.transationslist2;
    final addtransaction2 = productsdata.addtransaction2;
    final finallist = products2.where((product) {
      return product.id.contains(transactionid);
    }).toList();
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
                transations: finallist,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
