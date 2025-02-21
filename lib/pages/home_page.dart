import "package:flutter/material.dart";
import 'package:persona_duel/widgets/home_card.dart';
import 'package:persona_duel/widgets/card_loader.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar(
          isHome: true,
          titlePage: "Persona Duel",
        ),
        body: CardLoader(
          pageLoad: HomeCard(),
        ),
        bottomNavigationBar: myBottomNavbar());
  }
}
