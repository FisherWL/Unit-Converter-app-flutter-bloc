import 'package:flutter/material.dart';
import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:unit_converter/bloc/bloc_accuracy.dart';
import 'package:unit_converter/constant.dart';
import 'dart:math' show pow;

class AccuracySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccuracyBloc accuracyBloc = BlocProvider.of<AccuracyBloc>(context);
    return StreamBuilder<double>(
      stream: accuracyBloc.getStream,
      initialData: 3.0,
      builder: (context, acc) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: acc.data,
                  label: (1 / pow(10, acc.data.toInt())).toString(),
                  onChanged: (acc) => accuracyBloc.passAcc(acc),
                  min: 1,
                  max: 6,
                  activeColor: oliveGreen,
                  inactiveColor: lightGreen,
                  divisions: 5,
                ),
                Text(
                  'Accuracy',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: oliveGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ));
      },
    );
  }
}

//
//
//
extension StringExtension on String {
  String capFirst() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
