import 'package:flutter/material.dart';
import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:unit_converter/bloc/bloc_selected_genre.dart';
import 'package:unit_converter/bloc/bloc_input.dart';
import 'package:unit_converter/bloc/bloc_datum.dart';
import 'package:unit_converter/constant.dart';
import 'package:unit_converter/widget/accuracy_slider.dart';
import 'package:unit_converter/widget/cheat_sheet.dart';
import 'package:unit_converter/widget/unit_equation.dart';
import 'package:flutter/cupertino.dart';
import 'package:unit_converter/bloc/bloc_selected_abbr.dart';
import 'package:unit_converter/bloc/bloc_accuracy.dart';
import 'package:unit_converter/bloc/bloc_tapped_chip.dart';

class ConverterPageLifter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputBloc>(
      blocBuilder: () => InputBloc(),
      child: BlocProvider<ToDatumBloc>(
        blocBuilder: () => ToDatumBloc(),
        child: BlocProvider<SelectedRightAbbrBloc>(
          blocBuilder: () => SelectedRightAbbrBloc(),
          child: BlocProvider<SelectedLeftAbbrBloc>(
            blocBuilder: () => SelectedLeftAbbrBloc(),
            child: BlocProvider<AccuracyBloc>(
              blocBuilder: () => AccuracyBloc(),
              child: BlocProvider<TappedChipBloc>(
                blocBuilder: () => TappedChipBloc(),
                child: BlocProvider<TapChipSwitchBloc>(
                  blocBuilder: () => TapChipSwitchBloc(),
                  child: DismissKeyboard(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ConverterPage(),
    );
  }
}

class ConverterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TranslatedGenresStringBloc translatedGenresStringBloc =
        BlocProvider.of<TranslatedGenresStringBloc>(context);

    return StreamBuilder<String>(
        stream: translatedGenresStringBloc.getStream,
        initialData: 'Unit Converter',
        builder: (context, title) {
          return Scaffold(
            backgroundColor: lightYellow,
            appBar: AppBar(
              iconTheme: IconThemeData(color: lightYellow),
              elevation: 0,
              backgroundColor: darkGreen,
              title: Text(
                title.data.toUpperCase(),
                style: TextStyle(
                  color: lightYellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  UnitEquation(),
                  Expanded(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          CheatSheet(),
                          SizedBox(height: 30),
                          AccuracySlider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
