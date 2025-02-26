import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PersonaCard extends StatelessWidget {
  final String imageUrl;
  const PersonaCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(127, 255, 197, 74),
            blurRadius: 3,
            spreadRadius: 3,
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) {
                    print("Error loading image: $imageUrl");
                    return const Icon(Icons.image_not_supported, size: 50);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
