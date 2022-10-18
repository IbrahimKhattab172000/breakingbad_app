// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:breakingbad_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => CharactersScreen());
      default:
    }
  }
}
