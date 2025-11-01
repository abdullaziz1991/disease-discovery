import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class DiseasePredictor {
  late Interpreter _interpreter;
  late List<String> _labels;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/disease_model.tflite');
    final jsonString = await rootBundle.loadString('assets/labels.json');
    _labels = List<String>.from(json.decode(jsonString));
  }

  Future<String> predict(List<double> inputSymptoms) async {
    var input = [inputSymptoms]; 
    var output = List.filled(_labels.length, 0.0).reshape([1, _labels.length]);
    _interpreter.run(input, output);
    final outputScores = List<double>.from(output[0]);
    final maxIndex =
        outputScores.indexOf(outputScores.reduce((a, b) => a > b ? a : b));
    return _labels[maxIndex];
  }
}
