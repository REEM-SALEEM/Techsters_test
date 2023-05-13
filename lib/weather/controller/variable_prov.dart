import 'package:flutter/material.dart';

class VariableProvider extends ChangeNotifier {
  List<String> city = ['Hyderabad', 'Delhi', 'Bengaluru'];
  List<double> lat = [17.3850, 28.7041, 12.9716];
  List<double> long = [78.4867, 77.1025, 77.5946];
  String name = '';
  void getname(String indexname) {
    notifyListeners();
    name = indexname;
    notifyListeners();
  }
}
