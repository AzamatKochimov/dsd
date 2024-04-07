import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LangCodes { uz, ru, en}

const String _spLocalKey = 'app_local';

// ignore: prefer_mixin
class LocalController with ChangeNotifier {
  LocalController() : _appLocal = 'ru' {
    SharedPreferences.getInstance().then<void>(
      (sp) {
        final appLocal = sp.getString(_spLocalKey);
        if (appLocal != null && appLocal.isNotEmpty) {
          _appLocal = appLocal;
          notifyListeners();
        }
      },
      onError: l.w,
    );
  }

  Locale get appLocal => _appLocal == 'uz' ? const Locale('uz', 'UZ') : _appLocal == 'ru' ? const Locale('ru', 'RU') : const Locale('en', 'US');

  String _appLocal;

  void changeLocal(LangCodes langCode) {
    _appLocal = langCode.name;

    SharedPreferences.getInstance().then<void>(
      (sp) {
        sp.setString(_spLocalKey, _appLocal);
      },
      onError: l.w,
    );
    notifyListeners();
  }
}
