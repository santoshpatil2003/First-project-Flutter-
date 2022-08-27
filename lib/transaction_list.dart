import 'package:flutter/material.dart';
import './transations.dart';
import './button_widgit1.dart';
// import 'package:provider/provider.dart';
import 'transations.dart';

class TransactionList extends StatelessWidget {
  final List<Transations> transations;
  final String id;

  const TransactionList({this.transations, this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: transations.length,
            itemBuilder: ((context, index) => Button1(
                  cat: transations[index].catt,
                  id: transations[index].id,
                  index: index,
                )))
      ],
    );
  }
}
