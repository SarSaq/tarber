import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isCountry = prefs.getString('ff_isCountry') ?? _isCountry;
    });
    _safeInit(() {
      _userPhone = prefs.getString('ff_userPhone') ?? _userPhone;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _cityFROM = '';
  String get cityFROM => _cityFROM;
  set cityFROM(String value) {
    _cityFROM = value;
  }

  String _cityTO = '';
  String get cityTO => _cityTO;
  set cityTO(String value) {
    _cityTO = value;
  }

  DateTime? _DateRoute = DateTime.fromMillisecondsSinceEpoch(1740430620000);
  DateTime? get DateRoute => _DateRoute;
  set DateRoute(DateTime? value) {
    _DateRoute = value;
  }

  bool _alcohol = false;
  bool get alcohol => _alcohol;
  set alcohol(bool value) {
    _alcohol = value;
  }

  bool _electronics = false;
  bool get electronics => _electronics;
  set electronics(bool value) {
    _electronics = value;
  }

  bool _Foods = false;
  bool get Foods => _Foods;
  set Foods(bool value) {
    _Foods = value;
  }

  bool _Medicines = false;
  bool get Medicines => _Medicines;
  set Medicines(bool value) {
    _Medicines = value;
  }

  String _isCountry = 'Armenia';
  String get isCountry => _isCountry;
  set isCountry(String value) {
    _isCountry = value;
    prefs.setString('ff_isCountry', value);
  }

  String _userPhone = '';
  String get userPhone => _userPhone;
  set userPhone(String value) {
    _userPhone = value;
    prefs.setString('ff_userPhone', value);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
