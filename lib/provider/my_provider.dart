import 'dart:math';

import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  double height = 0;
  int age = 18;
  int weight = 60;
  double bmi = 0;
  String status = "";

  updateheight(dynamic h) {
    height = h;
    notifyListeners();
  }

  addWeight() {
    weight++;
    notifyListeners();
  }

  subWeight() {
    weight--;
    notifyListeners();
  }

  addAge() {
    age++;
    notifyListeners();
  }

  subAge() {
    age--;
    notifyListeners();
  }

  calstatus() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "healthy weight";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  double calBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi;
  }
}
