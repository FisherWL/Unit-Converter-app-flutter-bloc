import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SelectedLeftAbbrBloc implements BlocBase {
  PublishSubject<int> subjectCtrl = PublishSubject<int>();
  Stream<int> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passLeftAbbr(int s) {
    subjectCtrl.sink.add(s);
  }
}

class SelectedRightAbbrBloc implements BlocBase {
  PublishSubject<int> subjectCtrl = PublishSubject<int>();
  Stream<int> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passRightAbbr(int s) {
    subjectCtrl.sink.add(s);
  }
}
