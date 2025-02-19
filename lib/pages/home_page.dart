import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persona_duel/widgets/home_card_loader.dart';
import 'package:persona_duel/widgets/my_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar(),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 23, 54),
                    Color.fromARGB(255, 0, 24, 62),
                    Color.fromARGB(255, 0, 23, 54)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.5, 1.0]),
            ),
            child: HomeCardLoader()),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white, // Warna border putih
                width: 2, // Ketebalan border
              ),
            ),
          ),
          child: BottomNavigationBar(
            // Warna ikon saat dipilih
            unselectedItemColor: Colors.white, // Warna ikon saat tidak dipilih
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.collections),
                label: "Collection",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/battle.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Battle",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: "Mail",
              ),
            ],
          ),
        ));
  }
}
