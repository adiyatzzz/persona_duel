import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class PersonasBloc extends Cubit<List<Map<String, dynamic>>> {
  PersonasBloc() : super([]);

  Future<void> getPersonaOfTheDay() async {
    try {
      final response = await http
          .get(Uri.parse("https://persona-compendium.onrender.com/personas/"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> personas =
            List<Map<String, dynamic>>.from(data);
        emit(personas);
      }
    } catch (e) {
      print(e);
    }
  }
}
