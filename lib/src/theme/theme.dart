import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{

  bool _darkTheme = false;
  bool _customTheme = false;

  bool get dakTheme => this._darkTheme;

  set darkTheme(bool val){
    this.customTheme = false;
    this._darkTheme = val; 
    notifyListeners();
  }

  bool get customTheme => this._customTheme;

  set customTheme(bool val){
    this._darkTheme = false;
    this._customTheme = val; 
    notifyListeners();
  }

}