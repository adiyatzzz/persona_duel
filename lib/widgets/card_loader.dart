import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persona_duel/bloc/persona_of_the_day_bloc.dart';

class CardLoader extends StatelessWidget {
  Widget pageLoad;
  CardLoader({super.key, required this.pageLoad});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonaOfTheDayBloc, Map<String, dynamic>>(
      builder: (context, state) {
        // Cek apakah state kosong atau gambar belum termuat
        if (state.isEmpty || state["image"] == null || state["image"].isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Jika gambar sudah ada, lakukan precache agar tidak ada delay saat ditampilkan
        return FutureBuilder(
          future: precacheImage(NetworkImage(state["image"]), context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return this.pageLoad;
            } else {
              return const Center(
                  child: CircularProgressIndicator()); // Masih loading gambar
            }
          },
        );
      },
    );
  }
}
