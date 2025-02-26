import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persona_duel/bloc/personas_bloc.dart';
import 'package:persona_duel/widgets/home_card.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PersonasBloc>().getPersonaOfTheDay().then(
          (value) => true,
        );
    return BlocBuilder<PersonasBloc, List<Map<String, dynamic>>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return Scaffold(
            appBar: MyAppbar(isHome: true, titlePage: "Persona Duel"),
            body: const Center(
                child: CircularProgressIndicator()), // Loading indicator
            bottomNavigationBar: MyBottomNavbar(),
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
          body: HomeCard(data: data),
          bottomNavigationBar: MyBottomNavbar(),
        );
      },
    );
  }
}
