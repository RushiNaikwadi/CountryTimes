import 'package:flutter/material.dart';
import 'package:demoapp/Pages/Home.dart';
import 'package:demoapp/Pages/Loading.dart';
import 'package:demoapp/Pages/Choose_Location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => ChooseLocation(),
  },
));

