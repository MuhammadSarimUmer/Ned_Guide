import 'package:flutter/material.dart';

class ApplicationProvider extends ChangeNotifier {
  List<Map<String, dynamic>> applications = [];
  void addApplication(Map<String, dynamic> application) {
    applications.add(application);
    notifyListeners();
  }

  void removeApplication(Map<String, dynamic> application) {
    applications.remove(application);
    notifyListeners();
  }
}
