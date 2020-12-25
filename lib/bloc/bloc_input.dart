import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class InputBloc implements BlocBase {
  PublishSubject<String> subjectCtrl = PublishSubject<String>();
  Stream<String> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void passInput(String s) {
    if (s == '' || !isNumeric(s)) {
      return subjectCtrl.sink.add('0');
    }
    return subjectCtrl.sink.add(s);
  }
}
