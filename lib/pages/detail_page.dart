import 'package:flutter/material.dart';
import 'package:persona_duel/widgets/detail_card.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        titlePage: "Persona Detail",
      ),
      body: DetailCard(),
      bottomNavigationBar: const myBottomNavbar(),
    );
  }
}
