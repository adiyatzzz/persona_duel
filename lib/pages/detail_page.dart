import 'package:flutter/material.dart';
import 'package:persona_duel/widgets/detail_card.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> personaData;
  const DetailPage({super.key, required this.personaData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        titlePage: "Persona Detail",
      ),
      body: DetailCard(data: personaData),
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}
