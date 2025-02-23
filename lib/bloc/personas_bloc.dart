import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonasBloc extends Cubit<List<Map<String, dynamic>>> {
  PersonasBloc() : super([]);

  Future<void> getPersonaOfTheDay() async {
    try {
      final String response = await rootBundle.loadString('assets/db/persona_compendium.json');
      List<dynamic> data = json.decode(response);
      List<Map<String, dynamic>> personas = List<Map<String, dynamic>>.from(data);
      emit(personas);
    } catch (e) {
      print('Error loading local data: $e');
    }
  }
}
