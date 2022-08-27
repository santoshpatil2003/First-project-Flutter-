import 'package:flutter/material.dart';
import './transations.dart';
import './button_widgit2.dart';

class TransactionList2 extends StatelessWidget {
  final List<Transations2> transations;

  const TransactionList2({this.transations, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: transations.length,
            itemBuilder: ((context, index) => Button2(
                  cat: transations[index].type,
                  maxamount: transations[index].amountt,
                  id: transations[index].id,
                  date: transations[index].date,
                  index: index,
                )))
      ],
    );
  }
}
