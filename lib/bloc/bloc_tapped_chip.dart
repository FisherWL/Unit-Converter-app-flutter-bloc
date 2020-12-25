import 'package:unit_converter/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class TappedChipBloc implements BlocBase {
  PublishSubject<int> subjectCtrl = PublishSubject<int>();
  Stream<int> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passChipIndex(int i) {
    subjectCtrl.sink.add(i);
  }
}

class TapChipSwitchBloc implements BlocBase {
  PublishSubject<bool> subjectCtrl = PublishSubject<bool>();
  Stream<bool> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void passOnOff(bool b) {
    subjectCtrl.sink.add(b);
  }
}
