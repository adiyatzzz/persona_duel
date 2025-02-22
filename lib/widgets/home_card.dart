import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:persona_duel/bloc/persona_of_the_day_bloc.dart";
import "package:persona_duel/widgets/persona_card.dart";

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonaOfTheDayBloc, Map<String, dynamic>>(
      builder: (context, state) {
        print("Home : ${state}");
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Today's Persona",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white,
                  shadows: [
                    const Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(3, 3)),
                    Shadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(6, 6)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/detail", arguments: state);
              },
              child: PersonaCard(
                imageUrl: state["image"],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                state["name"] ?? "Unknown",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white,
                  shadows: [
                    const Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(3, 3)),
                    Shadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(6, 6)),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
