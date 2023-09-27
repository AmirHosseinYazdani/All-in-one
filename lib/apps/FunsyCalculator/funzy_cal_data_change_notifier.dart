import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataChangeNotifier extends ChangeNotifier {
  bool isNightMode = false;
  void updateNightMode(bool newStatus) {
    isNightMode = newStatus;
    notifyListeners();
  }

  bool resetAllSelectedButtons = false;
  void updateAllSelectedButtons(bool newStatus) {
    resetAllSelectedButtons = newStatus;
    notifyListeners();
  }

  bool changeNumberColor = false;
  void updateNumberColor(bool newStatus) {
    changeNumberColor = newStatus;
    notifyListeners();
  }

  bool firstLineSelected = false;
  void update1stLineColor(bool newStatus) {
    firstLineSelected = newStatus;
    notifyListeners();
  }

  bool secondLineSelected = false;
  void update2ndLineColor(bool newStatus) {
    secondLineSelected = newStatus;
    notifyListeners();
  }

  bool thirdLineSelected = false;
  void update3rdLineColor(bool newStatus) {
    thirdLineSelected = newStatus;
    notifyListeners();
  }

  bool fourthLineSelected = false;
  void update4thLineColor(bool newStatus) {
    fourthLineSelected = newStatus;
    notifyListeners();
  }

  bool fifthLineSelected = false;
  void update5thLineColor(bool newStatus) {
    fifthLineSelected = newStatus;
    notifyListeners();
  }

  bool sixthLineSelected = false;
  void update6thLineColor(bool newStatus) {
    sixthLineSelected = newStatus;
    notifyListeners();
  }

  bool seventhLineSelected = false;
  void update7thLineColor(bool newStatus) {
    seventhLineSelected = newStatus;
    notifyListeners();
  }

  bool eightLineSelected = false;
  void update8thLineColor(bool newStatus) {
    eightLineSelected = newStatus;
    notifyListeners();
  }

  bool ninthLineSelected = false;
  void update9thLineColor(bool newStatus) {
    ninthLineSelected = newStatus;
    notifyListeners();
  }

  bool zeroLineSelected = false;
  void update0thLineColor(bool newStatus) {
    zeroLineSelected = newStatus;
    notifyListeners();
  }
}
