import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ToDatumBloc implements BlocBase {
  PublishSubject<double> subjectCtrl = PublishSubject<double>();
  Stream<double> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void toDatum(double d, Map<String, double> genreMap) {
    for (int i = 0; i < genreMap.length; i++) {
      if (d == i) {
        subjectCtrl.sink.add(genreMap.values.toList()[i]);
      }
    }
  }
}
