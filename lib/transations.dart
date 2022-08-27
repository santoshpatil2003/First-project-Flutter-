import 'package:flutter/cupertino.dart';

class Transations {
  String catt;
  String id;

  Transations({this.catt, this.id});
}

class Transations2 {
  String type;
  double amountt;
  String id;
  String date;

  Transations2({this.type, this.amountt, this.id, this.date});
}

class Products with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Transations> _transationslist = [
    Transations(catt: "Others", id: "1"),
  ];

  List<Transations> get transationslist {
    return [..._transationslist];
  }

  final List<Transations> _transationscatlist = [
    Transations(catt: "Others", id: "1"),
  ];

  void insert() {
    for (var str in _transationslist) {
      add1(str.id);
      items[str.catt] = add1(str.id);
    }
  }

  Map<String, double> items = {};

  List<Transations> get transationscatlist {
    return [..._transationscatlist];
  }

  void addtransaction(String catinput, String selectedValue) {
    final translist = Transations(
      catt: catinput,
      id: selectedValue,
    );
    _transationscatlist.add(translist);
    _transationslist.add(translist);
    notifyListeners();
  }

  // ignore: prefer_final_fields
  List<Transations2> _transationslist2 = [];

  List<Transations2> get transationslist2 {
    return [..._transationslist2];
  }

  void addtransaction2(String catinput, double catmaxamount,
      String selectedValue2, String dateTime) {
    final translist = Transations2(
        type: catinput,
        amountt: catmaxamount,
        id: selectedValue2,
        date: dateTime);
    _transationslist2.add(translist);
    notifyListeners();
  }

  addall() {
    double s = 0;
    for (var element in _transationslist2) {
      s = element.amountt + s;
    }
    return s;
  }

  // int selectedValue = 0;

  selectedValue() {
    // int length = transationslist.length;
    int id = int.parse(transationslist[0].id);
    return id;
  }

  add1(String id) {
    double s = 0;
    for (var element in _transationslist2) {
      if (element.id == id) {
        s = element.amountt + s;
      }
    }
    return s;
  }

  remove1(index) {
    _transationscatlist.removeAt(index);
    _transationslist.removeAt(index);
    notifyListeners();
  }

  remove2(index) {
    _transationslist2.removeAt(index);
    notifyListeners();
  }
}

// class Add {
//   final List<Transations2> trans = transationslist2;

//   add({List<Transations2> trans}) {
//     double s = 0;

//     for (var item in trans) {
//       double a = item.amountt;
//       s = s + a;
//     }
//     return s;
//   }
//   double total = Add().add(trans: transationslist2);
// }
