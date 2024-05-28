import 'package:app_changer/models/user.dart';
import 'package:flutter/material.dart';

class SettingsController {
  AppSettings _appSettings;

  SettingsController(this._appSettings);

  void toggleDarkMode() {
    _appSettings.isDarkMode = !_appSettings.isDarkMode;
  }

  void setBodyTextColor(String color) {
    _appSettings.bodyTextColor = color;
  }

  void setBodyTextSize(String size) {
    _appSettings.bodyTextSize = size;
  }

  void setLanguage(String language) {
    _appSettings.language = language;
  }

  void setPin(String pin) {
    _appSettings.pin = pin;
  }
}