import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:unit_converter/bloc/bloc_selected_genre.dart';
import 'package:unit_converter/bloc/bloc_datum.dart';
import 'package:unit_converter/bloc/bloc_input.dart';
import 'package:unit_converter/constant.dart';
import 'package:unit_converter/widget/calcu_mech.dart';
import 'package:unit_converter/bloc/bloc_selected_abbr.dart';
import 'package:unit_converter/bloc/bloc_accuracy.dart';
import 'package:unit_converter/bloc/bloc_tapped_chip.dart';

class UnitEquation extends StatefulWidget {
  @override
  _UnitEquationState createState() => _UnitEquationState();
}

class _UnitEquationState extends State<UnitEquation> {
  FixedExtentScrollController scrollCtrlRight;
  FixedExtentScrollController scrollCtrlLeft;
  int leftIndex = 0;
  int rightIndex = 0;

  void tapChip(int i) {
    scrollCtrlRight.animateToItem(i,
        duration: Duration(milliseconds: 750), curve: Curves.easeOut);
    // setState(() {});
  }

  void jumpToRight(int i) {
    scrollCtrlRight.jumpToItem(i);
  }

  void jumpToLeft(int i) {
    scrollCtrlLeft.jumpToItem(i);
  }

  @override
  void initState() {
    super.initState();
    scrollCtrlLeft = FixedExtentScrollController();
    scrollCtrlRight = FixedExtentScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollCtrlRight.dispose();
    scrollCtrlLeft.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SelectedGenreMapBloc selectedGenreBloc =
        BlocProvider.of<SelectedGenreMapBloc>(context);
    InputBloc inputBloc = BlocProvider.of<InputBloc>(context);
    ToDatumBloc toDatumBloc = BlocProvider.of<ToDatumBloc>(context);
    SelectedLeftAbbrBloc leftAbbrBloc =
        BlocProvider.of<SelectedLeftAbbrBloc>(context);
    SelectedRightAbbrBloc rightAbbrBloc =
        BlocProvider.of<SelectedRightAbbrBloc>(context);
    AccuracyBloc accuracyBloc = BlocProvider.of<AccuracyBloc>(context);
    TappedChipBloc tappedChipBloc = BlocProvider.of<TappedChipBloc>(context);
    TapChipSwitchBloc tapChipSwitchBloc =
        BlocProvider.of<TapChipSwitchBloc>(context);

    return StreamBuilder<Map<String, double>>(
      stream: selectedGenreBloc.getStream,
      initialData: testCoeff,
      builder: (context, coeMap) {
        return StreamBuilder<String>(
          stream: inputBloc.getStream,
          initialData: '5',
          builder: (context, inputStr) {
            return StreamBuilder<double>(
              stream: toDatumBloc.getStream,
              initialData: 1.0,
              builder: (context, datumDou) {
                return Container(
                  color: oliveGreen,
                  child: Row(
                    children: <Widget>[
                      SizedBox(height: 172, width: 8),
                      Flexible(
                        flex: 7,
                        child: SizedBox(
                          height: 52,
                          child: Container(
                            color: oliveGreen,
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 52,
                              child: Container(
                                color: lightYellow,
                                child: TextFormField(
                                  initialValue: '5',
                                  textAlign: TextAlign.center,
                                  // need to input -7°C
                                  keyboardType: coeMap.data.containsKey('°C') ||
                                          coeMap.data.containsKey('inHg')
                                      ? TextInputType.numberWithOptions(
                                          signed: true, decimal: true)
                                      : TextInputType.numberWithOptions(
                                          decimal: true),
                                  showCursor: true,
                                  style: TextStyle(
                                    fontFamily: 'Roboto Condensed',
                                    color: oliveGreen,
                                    fontSize: 23,
                                  ),
                                  onChanged: (s) => inputBloc
                                      .passInput(s.replaceAll(',', '.')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        flex: 4,
                        child: Container(
                          height: 172,
                          child: CupertinoPicker(
                            scrollController: scrollCtrlLeft,
                            backgroundColor: oliveGreen,
                            looping: true,
                            itemExtent: 52,
                            onSelectedItemChanged: (i) {
                              toDatumBloc.toDatum(i.toDouble(), coeMap.data);
                              leftAbbrBloc.passLeftAbbr(i);
                              leftIndex = i;
                            },
                            children: coeMap.data.keys
                                .map((e) => UnitPicker(e))
                                .toList(),
                          ),
                        ),
                      ),
                      Container(
                        child: Container(
                          width: 28,
                          height: 28,
                          child: FittedBox(
                            child: FloatingActionButton(
                              backgroundColor: oliveGreen,
                              mini: true,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/png/equal-convert.png'),
                                ),
                              ),
                              onPressed: () {
                                int l = leftIndex;
                                int r = rightIndex;
                                jumpToLeft(coeMap.data.length - 1 - r);
                                jumpToRight(coeMap.data.length - 1 - l);
                              },
                            ),
                          ),
                        ),
                      ),
                      // Text(
                      //   ' = ',
                      //   style: TextStyle(
                      //     fontFamily: 'Roboto Condensed',
                      //     fontSize: 28,
                      //     color: lightYellow,
                      //   ),
                      // ),
                      Flexible(
                        flex: 9,
                        child: Container(
                          height: 172,
                          child: StreamBuilder<double>(
                              stream: accuracyBloc.getStream,
                              initialData: 3.0,
                              builder: (context, acc) {
                                return StreamBuilder<int>(
                                    stream: tappedChipBloc.getStream,
                                    initialData: 0,
                                    builder: (context, chip) {
                                      return StreamBuilder<bool>(
                                          stream: tapChipSwitchBloc.getStream,
                                          initialData: false,
                                          builder: (context, isOn) {
                                            if (isOn.data) {
                                              tapChip(coeMap.data.length -
                                                  1 -
                                                  chip.data);
                                              tapChipSwitchBloc
                                                  .passOnOff(false);
                                            }
                                            return CupertinoPicker(
                                              scrollController: scrollCtrlRight,
                                              backgroundColor: oliveGreen,
                                              itemExtent: 52,
                                              onSelectedItemChanged: (i) {
                                                rightAbbrBloc.passRightAbbr(
                                                    coeMap.data.length - 1 - i);
                                                rightIndex = i;
                                              },
                                              looping: true,
                                              children: coeMap.data.entries
                                                  .map((e) => CalcuMech(
                                                      inputStr.data,
                                                      datumDou.data,
                                                      e.value,
                                                      e.key,
                                                      acc.data))
                                                  .toList()
                                                  .reversed
                                                  .toList(),
                                            );
                                          });
                                    });
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
