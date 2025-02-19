import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Persona Duel",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            // Tambahkan aksi yang diinginkan saat tombol ditekan
            Navigator.of(context).pushNamed("/");
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
