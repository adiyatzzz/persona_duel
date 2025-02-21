import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persona_duel/bloc/persona_of_the_day_bloc.dart';
import 'package:persona_duel/routes/myroute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = MyRoute();
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PersonaOfTheDayBloc())],
        child: MaterialApp(
          title: 'Persona Duel',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color.fromARGB(255, 121, 215, 253),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 121, 215, 253),
                secondary: Color.fromARGB(255, 0, 23, 54)),
            scaffoldBackgroundColor: Color.fromARGB(255, 0, 23, 54),
            appBarTheme:
                AppBarTheme(backgroundColor: Color.fromARGB(255, 0, 23, 54)),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 0, 23, 54),
                unselectedItemColor: Colors.white,
                selectedItemColor: Color.fromARGB(255, 121, 215, 253)),
            useMaterial3: true,
          ),
          onGenerateRoute: (settings) => router.onRoute(settings),
        ));
  }
}
