import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeCardBloc extends Cubit<Map<String, dynamic>> {
  HomeCardBloc() : super({});

  Future<void> getPersonaOfTheDay() async {
    try {
      final response = await http
          .get(Uri.parse("https://persona-compendium.onrender.com/personas/"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        // List<Persona> personas =
        //     data.map((json) => Persona.fromJson(json)).toList();

        DateTime today = DateTime.now();
        int dayOfYear = int.parse(DateFormat("D").format(today));
        if (dayOfYear > data.length) {
          dayOfYear -= data.length;
        }

        emit(data[dayOfYear]);
      }
    } catch (e) {
      print(e);
    }
  }
}
