import 'package:flutter/material.dart';
import 'package:unit_converter/constant.dart';
import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:unit_converter/bloc/bloc_selected_genre.dart';

class GenreListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkYellow,
      appBar: AppBar(
        iconTheme: IconThemeData(color: lightYellow),
        elevation: 0,
        title: Text(
          'UNIT CONVERTER',
          style: TextStyle(
            color: lightYellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: darkGreen,
      ),
      body: SafeArea(
        child: GenreList(),
      ),
    );
  }
}

List<String> enGenreList = enGenreUnitsMap.keys.toList();
List<String> enUnitsList = enGenreUnitsMap.values.toList();

class GenreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectedGenreMapBloc selectedMapBloc =
        BlocProvider.of<SelectedGenreMapBloc>(context);

    TranslatedGenresStringBloc translatedGenresStringBloc =
        BlocProvider.of<TranslatedGenresStringBloc>(context);

    SelectedEnGenreStringBloc selectedEnStringBloc =
        BlocProvider.of<SelectedEnGenreStringBloc>(context);

    return ListView(
      children: List.generate(
        enGenreUnitsMap.length,
        (index) => Container(
          color: (index % 2 == 0) ? lightYellow : darkYellow,
          child: ListTile(
            leading: Image(
              image: AssetImage('assets/png/${enGenreList[index]}.png'),
              height: 27,
              width: 27,
            ),
            title: Text(
              enGenreList[index].capFirstLetter(),
              style: TextStyle(
                color: oliveGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              enUnitsList[index],
              style: TextStyle(
                color: oliveGreen,
                fontFamily: 'Open Sans Condensed',
              ),
            ),
            onTap: () {
              selectedMapBloc.passMap(enGenreList[index]);
              translatedGenresStringBloc.passString(enGenreList[index]);
              selectedEnStringBloc.passString(enGenreList[index]);
              Navigator.pushNamed(context, '/converter');
            },
          ),
        ),
      ),
    );
  }
}

//
//
//
extension StringExtension on String {
  String capFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
