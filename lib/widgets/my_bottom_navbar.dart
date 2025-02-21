import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class myBottomNavbar extends StatelessWidget {
  const myBottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        selectedItemColor: Colors.white,
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
    );
  }
}
