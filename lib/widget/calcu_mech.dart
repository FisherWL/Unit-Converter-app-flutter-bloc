import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unit_converter/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:number_display/number_display.dart';

//
class CalcuMech extends StatelessWidget {
  final String inputStr;
  final double datumDouFrom;
  final double datumDouTo;
  final String unit;
  final double acc;
  //
  // result = inputStr * datumDouFrom / datumDouTo;
  // e.g. 5 m = 5.0 * 100 / 30.48 ft = 16.4 ft
  //
  CalcuMech(
      this.inputStr, this.datumDouFrom, this.datumDouTo, this.unit, this.acc);

  @override
  Widget build(BuildContext context) {
    double result;
    double inputDouble = double.parse(inputStr);
    result = inputDouble * datumDouFrom / datumDouTo;

    final display = createDisplay(length: 9, decimal: acc.toInt());

    String removeZero(double res, int acc) {
      List<String> resSplit = res.toStringAsExponential(acc).split('');

      int eLocation = resSplit.indexOf('e');
      int pointLocation = resSplit.indexOf('.');
      for (int i = eLocation - 1; i > pointLocation; i--) {
        if (resSplit[i] == '0') {
          resSplit.removeAt(i);
        } else
          break;
      }

      int newPointLocation = resSplit.indexOf('.');
      int newELocation = resSplit.indexOf('e');
      if (newPointLocation + 1 == newELocation) {
        resSplit.remove('.');
      }

      return (resSplit.join());
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // using Text inside a Row
      Flexible(
        child: AutoSizeText(
          (result > 99999999999999999 || result < 1 / pow(10, acc.toInt())) &&
                  result > 0
              ? removeZero(result, acc.toInt())
              : display(result),
          style: TextStyle(
            fontFamily: 'Roboto Condensed',
            color: lightYellow,
          ),
          overflow: TextOverflow.clip,
          maxLines: 1,
          minFontSize: 14,
          maxFontSize: 21,
        ),
      ),
      SizedBox(
        width: 14,
      ),
      Flexible(
        child: AutoSizeText(
          unit,
          style: TextStyle(
            fontFamily: 'Roboto Condensed',
            color: lightYellow,
            fontSize: 21,
          ),
          maxLines: 1,
        ),
      ),
    ]);
  }
}

//
//
//
class UnitPicker extends StatelessWidget {
  final String unit;
  UnitPicker(this.unit);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
        unit,
        style: TextStyle(
          fontFamily: 'Roboto Condensed',
          color: lightYellow,
        ),
        maxLines: 1,
      ),
    );
  }
}
