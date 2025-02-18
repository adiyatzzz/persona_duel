import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Persona Duel",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 500,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/cardbg.jpg", // Pastikan path benar
                    fit: BoxFit.cover, // Stretch gambar sesuai ukuran parent
                  ),
                ),

                // Foreground Image (Gambar atas)
                Align(
                  alignment: Alignment.center, // Posisikan gambar tengah
                  child: FractionallySizedBox(
                    widthFactor: 0.8, // 80% dari lebar parent (lebih kecil)
                    heightFactor: 0.8, // 80% dari tinggi parent (lebih kecil)
                    child: Image.network(
                      "https://megatenwiki.com/images/b/b3/P3_Orpheus_Artwork.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "ORPHEUS",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.collections), label: "Collection"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Battle"),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Mail"),
      ]),
    );
  }
}
