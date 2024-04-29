import 'package:flutter/cupertino.dart';

class TimerStatusNotifier extends ChangeNotifier {
  bool isPlaying = false;

  void setPlaying(bool value) {
    isPlaying = value;
    notifyListeners();
  }
}
