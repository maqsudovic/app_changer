import 'package:app_changer/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SettingsController _controller;
  late AppSettings _appSettings;

  @override
  void initState() {
    super.initState();
    _appSettings = AppSettings(
      isDarkMode: false,
      bodyTextColor: '#000000',
      bodyTextSize: '16sp',
      language: 'en',
      pin: '1234',
    );
    _controller = SettingsController(_appSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: _appSettings.isDarkMode ? Colors.black : Colors.white,
        foregroundColor: _appSettings.isDarkMode ? Colors.white : Colors.black,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(
                color: _appSettings.isDarkMode ? Colors.white : Colors.black,
                fontSize: double.parse(
                    _appSettings.bodyTextSize.replaceFirst('sp', '')),
              ),
            ),
            trailing: Switch(
              value: _appSettings.isDarkMode,
              onChanged: (value) {
                setState(() {
                  _controller.toggleDarkMode();
                });
              },
              activeColor: Colors.blue,
              activeTrackColor: Colors.blueAccent,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.shade400,
            ),
          ),
          ListTile(
            title: Text(
              'Body Text Color',
              style: TextStyle(
                color: _appSettings.isDarkMode ? Colors.white : Colors.black,
                fontSize: double.parse(
                    _appSettings.bodyTextSize.replaceFirst('sp', '')),
              ),
            ),
            trailing: DropdownButton<String>(
              value: _appSettings.bodyTextColor,
              onChanged: (color) {
                setState(() {
                  _controller.setBodyTextColor(color!);
                });
              },
              items: ['#FFFFFF', '#000000', '#FF0000', '#00FF00', '#0000FF']
                  .map((color) {
                return DropdownMenuItem<String>(
                  value: color,
                  child: Text(
                    'Text',
                    style: TextStyle(
                      color: Color(int.parse(color.replaceFirst('#', '0xff'))),
                      fontSize: double.parse(
                          _appSettings.bodyTextSize.replaceFirst('sp', '')),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text(
              'Body Text Size',
              style: TextStyle(
                color: Color(int.parse(
                    _appSettings.bodyTextColor.replaceFirst('#', '0xff'))),
                fontSize: double.parse(
                    _appSettings.bodyTextSize.replaceFirst('sp', '')),
              ),
            ),
            trailing: DropdownButton<String>(
              value: _appSettings.bodyTextSize,
              onChanged: (size) {
                setState(() {
                  _controller.setBodyTextSize(size!);
                });
              },
              items: ['12sp', '14sp', '16sp', '18sp', '20sp'].map((size) {
                return DropdownMenuItem<String>(
                  value: size,
                  child: Text(
                    'Size',
                    style: TextStyle(
                      color: Color(int.parse(_appSettings.bodyTextColor
                          .replaceFirst('#', '0xff'))),
                      fontSize: double.parse(size.replaceFirst('sp', '')),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text(
              'Language',
              style: TextStyle(
                color: Color(int.parse(
                    _appSettings.bodyTextColor.replaceFirst('#', '0xff'))),
                fontSize: double.parse(
                    _appSettings.bodyTextSize.replaceFirst('sp', '')),
              ),
            ),
            trailing: DropdownButton<String>(
              value: _appSettings.language,
              onChanged: (language) {
                setState(() {
                  _controller.setLanguage(language!);
                });
              },
              items: ['uz', 'ru', 'en'].map((language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(
                    language,
                    style: TextStyle(
                      color: Color(int.parse(_appSettings.bodyTextColor
                          .replaceFirst('#', '0xff'))),
                      fontSize: double.parse(
                          _appSettings.bodyTextSize.replaceFirst('sp', '')),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text(
              'PIN Code',
              style: TextStyle(
                color: Color(int.parse(
                    _appSettings.bodyTextColor.replaceFirst('#', '0xff'))),
                fontSize: double.parse(
                    _appSettings.bodyTextSize.replaceFirst('sp', '')),
              ),
            ),
            trailing: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String newPin = '';
                    return AlertDialog(
                      title: Text(
                        'Set PIN Code',
                        style: TextStyle(
                          color: Color(int.parse(_appSettings.bodyTextColor
                              .replaceFirst('#', '0xff'))),
                          fontSize: double.parse(
                              _appSettings.bodyTextSize.replaceFirst('sp', '')),
                        ),
                      ),
                      content: TextField(
                        style: TextStyle(
                          color: Color(int.parse(_appSettings.bodyTextColor
                              .replaceFirst('#', '0xff'))),
                          fontSize: double.parse(
                              _appSettings.bodyTextSize.replaceFirst('sp', '')),
                        ),
                        onChanged: (value) {
                          newPin = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter new PIN code',
                          hintStyle: TextStyle(
                            color: Color(int.parse(_appSettings.bodyTextColor
                                .replaceFirst('#', '0xff'))),
                            fontSize: double.parse(_appSettings.bodyTextSize
                                .replaceFirst('sp', '')),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _controller.setPin(newPin);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Color(int.parse(_appSettings.bodyTextColor
                                  .replaceFirst('#', '0xff'))),
                              fontSize: double.parse(_appSettings.bodyTextSize
                                  .replaceFirst('sp', '')),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                _appSettings.pin,
                style: TextStyle(
                  color: Color(int.parse(
                      _appSettings.bodyTextColor.replaceFirst('#', '0xff'))),
                  fontSize: double.parse(
                      _appSettings.bodyTextSize.replaceFirst('sp', '')),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: _appSettings.isDarkMode ? Colors.black : Colors.white,
    );
  }
}
