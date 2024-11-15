import 'package:flutter/cupertino.dart';

class LampuProvider extends ChangeNotifier{

  bool _isHidup = false;
  bool get isHidup => _isHidup;

  void statusLampu(bool status) {
    _isHidup = status;
    notifyListeners();
  }

}