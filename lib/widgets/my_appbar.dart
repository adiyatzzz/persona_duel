import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  bool isHome;
  String titlePage;
  MyAppbar({
    super.key,
    this.isHome = false,
    required this.titlePage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        titlePage,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      actions: (isHome == false)
          ? [
              IconButton(
                padding: EdgeInsets.all(5),
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {
                  // Tambahkan aksi yang diinginkan saat tombol ditekan
                  Navigator.of(context).pop();
                },
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
