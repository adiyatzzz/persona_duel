import "package:flutter/material.dart";

class CardLoader extends StatelessWidget {
  Widget pageLoad;
  String imageLoad;
  CardLoader({super.key, required this.pageLoad, required this.imageLoad});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(imageLoad), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return pageLoad;
        } else {
          return const Center(
              child: CircularProgressIndicator()); // Masih loading gambar
        }
      },
    );
  }
}
