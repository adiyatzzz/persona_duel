import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persona_duel/bloc/home_card_bloc.dart';
import 'package:persona_duel/widgets/home_card.dart';

class HomeCardLoader extends StatelessWidget {
  const HomeCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    // Panggil getPersonaOfTheDay() saat pertama kali widget dibangun
    context.read<HomeCardBloc>().getPersonaOfTheDay();
    return BlocBuilder<HomeCardBloc, Map<String, dynamic>>(
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
              return const HomeCard(); // Tampilkan HomeCard jika gambar selesai dimuat
            } else {
              return const Center(child: CircularProgressIndicator()); // Masih loading gambar
            }
          },
        );
      },
    );
  }
}