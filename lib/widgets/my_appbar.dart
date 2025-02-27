import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final String titlePage;
  final TabController? tabController; // TabController bisa null

  MyAppbar({
    super.key,
    this.isHome = false,
    required this.titlePage,
    this.tabController, // Tidak wajib diisi
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading:
              (titlePage == "Persona Detail") ? true : false,
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
                      // Navigasi ke halaman utama
                      Navigator.of(context).pushReplacementNamed("/");
                    },
                  ),
                ]
              : null,
        ),

        /// Hanya tampilkan TabBar jika tabController tidak null
        if (tabController != null)
          Container(
            color: Colors.transparent, // Warna transparan
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              tabs: const [
                Tab(text: "Collection"),
                Tab(text: "My Persona"),
                Tab(text: "Skill"),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight +
            (tabController != null ? 48 : 0), // Tambah tinggi jika ada TabBar
      );
}
