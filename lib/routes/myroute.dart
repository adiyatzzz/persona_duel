import 'package:flutter/material.dart';
import 'package:persona_duel/pages/collection_page.dart';
import 'package:persona_duel/pages/detail_page.dart';
import 'package:persona_duel/pages/home_page.dart';

class MyRoute {
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case "/detail":
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;
            return DetailPage(personaData: args ?? {});
          },
        );

      case "/collection":
        return MaterialPageRoute(
          builder: (context) {
            return CollectionPage();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
    }
  }
}
