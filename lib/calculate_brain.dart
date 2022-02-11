import 'dart:math';

class CalculateBrain {
  final int height;
  final int weight;
  double _bmi = 0;

  CalculateBrain({required this.height, required this.weight});

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 30) {
      return 'Obese'.toUpperCase();
    } else if (_bmi >= 25) {
      return 'Overweight'.toUpperCase();
    } else if (_bmi >= 18.5) {
      return 'Normal'.toUpperCase();
    } else {
      return 'UnderWeight'.toUpperCase();
    }
  }

  String getInterpretation() {
    if (_bmi > 30) {
      return 'You really should exercises more and eat healthy food. You should care your body the most!';
    } else if (_bmi >= 25) {
      return 'You have above average body weight. get some exercises and keep your body fit!';
    } else if (_bmi >= 18.5) {
      return 'You have the perfect body weight. Keep up the good work!';
    } else {
      return 'You have under average body weight. You should exercises and eat some more!';
    }
  }
}
