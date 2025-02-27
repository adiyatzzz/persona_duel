import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  const MyBottomNavbar({
    super.key,
    this.selectedIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white, // Warna border putih
            width: 2, // Ketebalan border
          ),
        ),
      ),
      child: BottomNavigationBar(
        selectedItemColor: (selectedIndex >= 0)
            ? Color.fromARGB(255, 121, 215, 253)
            : Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          if (value == 0 && selectedIndex != 0) {
            Navigator.pushNamed(context, "/collection");
          } else if (value == 1 && selectedIndex != 1) {
            Navigator.pushNamed(context, "/battle");
          } else if (value == 2 && selectedIndex != 2) {
            Navigator.pushNamed(context, "/mail");
          }
        },
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
