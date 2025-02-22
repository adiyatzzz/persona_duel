import "package:flutter/material.dart";
import "package:persona_duel/widgets/persona_card.dart";

class HomeCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const HomeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
                    blurRadius: 10, color: Colors.black, offset: Offset(3, 3)),
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
            Navigator.pushNamed(context, "/detail", arguments: data);
          },
          child: PersonaCard(
            imageUrl: data["image"],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            data["name"] ?? "Unknown",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
              shadows: [
                const Shadow(
                    blurRadius: 10, color: Colors.black, offset: Offset(3, 3)),
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
  }
}
