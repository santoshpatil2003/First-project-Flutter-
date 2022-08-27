// import 'package:flutter/material.dart';
// import 'transations.dart';

// class UserTransactiondata extends StatefulWidget {
//   final Function addTx;
//   const UserTransactiondata({this.addTx, Key key}) : super(key: key);

//   @override
//   State<UserTransactiondata> createState() => _UserTransactiondataState();
// }

// class _UserTransactiondataState extends State<UserTransactiondata> {
//   // List<Transations> transationslist = [
//   //   Transations(catt: "Shopping", maxamountt: "1000"),
//   //   Transations(catt: "Entertainment", maxamountt: "500"),
//   //   Transations(catt: "College", maxamountt: "200"),
//   //   Transations(catt: "Books", maxamountt: "600"),
//   // ];

//   final addnameinput = TextEditingController();
//   final addamountinput = TextEditingController();

//   void submitData() {
//     final enterdcat = addnameinput.text;
//     final enterdmaxamount = addamountinput.text;

//     if (enterdcat.isEmpty || enterdmaxamount.isEmpty) {
//       return;
//     }

//     widget.addTx(
//       enterdcat,
//       enterdmaxamount,
//     );

//     Navigator.of(context).pop();
//   }

//   void addtransaction(String catinput, String catmaxamount) {
//     final translist = Transations(catt: catinput, maxamountt: catmaxamount);

//     setState(() {
//       transationslist.add(translist);
//     });
//   }

//   void addnewtrancation() {
//     // addtransaction(addnameinput.text, addamountinput.text);
//     setState(() {
//       addtransaction(addnameinput.text, addamountinput.text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         UserTransactiondata(
//           addTx: addnewtrancation,
//         ),
//       ],
//     );
//   }
// }
