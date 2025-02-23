import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:persona_duel/bloc/personas_bloc.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';
import 'package:persona_duel/widgets/persona_card.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(titlePage: "Persona Collection"),
      body: BlocBuilder<PersonasBloc, List<Map<String, dynamic>>>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah item per baris
                crossAxisSpacing: 20, // Jarak antar item horizontal
                mainAxisSpacing: 20, // Jarak antar item vertikal
                childAspectRatio: 0.7, // Lebar : Tinggi (0.5 agar lebih tinggi)
              ),
              itemCount: state.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/detail",
                        arguments: state[index]);
                  },
                  child: Stack(children: [
                    PersonaCard(imageUrl: state[index]['image']),
                    Align(
                      alignment: Alignment(0, 0.85),
                      child: LayoutBuilder(
                        builder: (context, constraints) => Container(
                            width: constraints.maxWidth * 0.85,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                state[index]['name'] ?? "Unknown",
                                textAlign: TextAlign.center,
                                maxLines:
                                    1, // Agar teks tidak lebih dari 1 baris
                                minFontSize: 12, // Ukuran font minimum
                                style: TextStyle(
                                  fontSize: 20,
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
                                        color:
                                            Color.fromARGB(127, 255, 197, 74),
                                        offset: const Offset(3, 3)),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    )
                  ]),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: MyBottomNavbar(
        selectedIndex: 0,
      ),
    );
  }
}
