import 'package:flutter/material.dart';
import 'package:persona_duel/widgets/card_loader.dart';
import 'package:persona_duel/widgets/detail_card.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> personaData;
  const DetailPage({super.key, required this.personaData});

  @override
  Widget build(BuildContext context) {
    print("Detail : ${personaData}");
    return Scaffold(
      appBar: MyAppbar(
        titlePage: "Persona Detail",
      ),
      body: CardLoader(pageLoad: DetailCard(data: personaData), imageLoad: personaData["image"],),
      bottomNavigationBar: const myBottomNavbar(),
    );
  }
}
