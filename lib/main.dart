import 'package:flutter/material.dart';
import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:unit_converter/bloc/bloc_selected_genre.dart';
import 'package:unit_converter/application.dart';

void main() {
  runApp(ListPageLifter());
}

class ListPageLifter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectedGenreMapBloc>(
      blocBuilder: () => SelectedGenreMapBloc(),
      child: BlocProvider<TranslatedGenresStringBloc>(
        blocBuilder: () => TranslatedGenresStringBloc(),
        child: BlocProvider<SelectedEnGenreStringBloc>(
          blocBuilder: () => SelectedEnGenreStringBloc(),
          child: Application(),
        ),
      ),
    );
  }
}
