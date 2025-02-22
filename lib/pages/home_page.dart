import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persona_duel/bloc/personas_bloc.dart';
import 'package:persona_duel/widgets/home_card.dart';
import 'package:persona_duel/widgets/card_loader.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonasBloc, List<Map<String, dynamic>>>(
      builder: (context, state) {
        // Tampilkan loading saat state masih kosong
        if (state.isEmpty) {
          context.read<PersonasBloc>().getPersonaOfTheDay();
          return Scaffold(
            appBar: MyAppbar(isHome: true, titlePage: "Persona Duel"),
            body: const Center(child: CircularProgressIndicator()), // Loading indicator
            bottomNavigationBar: myBottomNavbar(),
          );
        }

        DateTime today = DateTime.now();
        int dayOfYear = int.parse(DateFormat("D").format(today));
        if (dayOfYear > state.length) {
          dayOfYear -= state.length;
        }

        Map<String, dynamic> data = state[dayOfYear];

        return Scaffold(
          appBar: MyAppbar(isHome: true, titlePage: "Persona Duel"),
          body: CardLoader(
            imageLoad: data["image"],
            pageLoad: HomeCard(data: data),
          ),
          bottomNavigationBar: myBottomNavbar(),
        );
      },
    );
  }
}

