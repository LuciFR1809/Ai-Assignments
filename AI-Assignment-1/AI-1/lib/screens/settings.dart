import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screen_lock/configurations/input_button_config.dart';
import 'package:flutter_screen_lock/configurations/screen_lock_config.dart';
import 'package:flutter_screen_lock/configurations/secret_config.dart';
import 'package:flutter_screen_lock/configurations/secrets_config.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:flutter_screen_lock/screen_lock.dart';

class settings extends StatefulWidget {

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
    child:ScreenLock(
      title: Text('  Password for settings\n(still under construction)'),
      confirmTitle: Text('  Password for settings\n(still under construction)'),
  correctString: '1234',
      screenLockConfig: ScreenLockConfig(
        backgroundColor: Colors.cyan,
      ),
),
        ),
    ),
        );
  }
}

