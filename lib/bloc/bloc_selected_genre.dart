import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unit_converter/constant.dart';

class SelectedGenreMapBloc implements BlocBase {
  BehaviorSubject<Map<String, double>> subjectCtrl =
      BehaviorSubject<Map<String, double>>();
  Stream<Map<String, double>> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passMap(String s) {
    subjectCtrl.sink.add(coefficient[s]);
  }
}

//
//
//
class TranslatedGenresStringBloc implements BlocBase {
  BehaviorSubject<String> subjectCtrl = BehaviorSubject<String>();
  Stream<String> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passString(String s) => subjectCtrl.sink.add(s);
}

//
//
//
class SelectedEnGenreStringBloc implements BlocBase {
  BehaviorSubject<String> subjectCtrl = BehaviorSubject<String>();
  Stream<String> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passString(String s) => subjectCtrl.sink.add(s);
}
