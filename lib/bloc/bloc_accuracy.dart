import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class AccuracyBloc implements BlocBase {
  BehaviorSubject<double> subjectCtrl = BehaviorSubject<double>();
  Stream<double> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passAcc(double d) => subjectCtrl.sink.add(d);
}
