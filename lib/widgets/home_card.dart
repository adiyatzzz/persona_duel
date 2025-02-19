import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:persona_duel/bloc/home_card_bloc.dart";

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCardBloc, Map<String, dynamic>>(
      builder: (context, state) {
        print("Home Card : ${state}");

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
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(127, 255, 197, 74),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: SizedBox(
                width: 350,
                height: 500,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/cardbg.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        heightFactor: 0.8,
                        child: Image.network(
                          state["image"],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported, size: 50),
                        ),
                      ),
                    ),
                  ],
                ),
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
