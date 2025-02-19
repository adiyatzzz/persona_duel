import 'package:flutter/material.dart';
import 'package:persona_duel/pages/home_page.dart';

class MyRoute {
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
    }
  }
}
