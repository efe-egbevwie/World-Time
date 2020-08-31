
import 'package:flutter/material.dart';
import 'package:world_time/Activities/home_screen.dart';
import 'package:world_time/Activities/loading_screen.dart';
import 'package:world_time/Activities/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));


