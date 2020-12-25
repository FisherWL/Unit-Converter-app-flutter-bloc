import 'package:flutter/material.dart';
import 'package:unit_converter/constant.dart';
import 'package:unit_converter/bloc/bloc_selected_abbr.dart';
import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:unit_converter/bloc/bloc_selected_genre.dart';
import 'package:unit_converter/bloc/bloc_tapped_chip.dart';

class CheatSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectedGenreMapBloc selectedMapBloc =
        BlocProvider.of<SelectedGenreMapBloc>(context);
    SelectedRightAbbrBloc rightAbbrBloc =
        BlocProvider.of<SelectedRightAbbrBloc>(context);
    SelectedLeftAbbrBloc leftAbbrBloc =
        BlocProvider.of<SelectedLeftAbbrBloc>(context);
    SelectedEnGenreStringBloc selectedEnStringBloc =
        BlocProvider.of<SelectedEnGenreStringBloc>(context);
    TappedChipBloc tappedChipBloc = BlocProvider.of<TappedChipBloc>(context);
    TapChipSwitchBloc tapChipSwitchBloc =
        BlocProvider.of<TapChipSwitchBloc>(context);

    return StreamBuilder<Map<String, double>>(
        stream: selectedMapBloc.getStream,
        builder: (context, map) {
          if (map.hasData) {
            return StreamBuilder<String>(
              stream: selectedEnStringBloc.getStream,
              builder: (context, str) {
                if (str.hasData) {
                  return StreamBuilder<int>(
                      stream: rightAbbrBloc.getStream,
                      initialData: (map.data.length - 1),
                      builder: (context, right) {
                        return StreamBuilder<int>(
                            stream: leftAbbrBloc.getStream,
                            initialData: 0,
                            builder: (context, left) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 8,
                                  runSpacing: -6,
                                  children: List.generate(
                                    map.data.length,
                                    (index) => InputChip(
                                      onPressed: () {
                                        tappedChipBloc.passChipIndex(index);
                                        tapChipSwitchBloc.passOnOff(true);
                                      },
                                      shape: chipBorderHighlighter(
                                          left.data, right.data, index),
                                      labelStyle: chipFontHighlighter(
                                          left.data, right.data, index),
                                      backgroundColor: chipColorHighlighter(
                                          left.data, right.data, index),
                                      label: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              map.data.keys.toList()[index],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'Roboto Condensed'),
                                            ),
                                            Text(' - '),
                                            Text(
                                              abbrMap[str.data]
                                                  .split(",")[index],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'Roboto Condensed'),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              );
                            });
                      });
                } else
                  return Container();
              },
            );
          }
          return Container();
        });
  }

  //
  //
  //
  Color chipColorHighlighter(int left, int right, int index) {
    if (right == left) {
      return lightGreen;
    } else if (index == left) {
      return lightYellow;
    } else if (index == right) {
      return oliveGreen;
    } else
      return lightGreen;
  }

  //
  TextStyle chipFontHighlighter(int left, int right, int index) {
    if (right == left) {
      return TextStyle(
        color: lightYellow,
        // fontWeight: FontWeight.bold,
      );
    } else if (index == left) {
      return TextStyle(
        color: oliveGreen,
        // fontWeight: FontWeight.bold,
      );
    } else if (index == right) {
      return TextStyle(
        color: lightYellow,
        // fontWeight: FontWeight.bold,
      );
    } else
      return TextStyle(color: lightYellow);
  }

  //
  ShapeBorder chipBorderHighlighter(int left, int right, int index) {
    if (index == left) {
      return RoundedRectangleBorder(
        side: BorderSide(color: oliveGreen, width: 1.25),
        borderRadius: BorderRadius.circular(20),
      );
    }
    // else
    //   return RoundedRectangleBorder(
    //     side: BorderSide(color: lightGreen, width: 1.25),
    //     borderRadius: BorderRadius.circular(20),
    //   );
  }
}
