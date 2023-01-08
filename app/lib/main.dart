import 'package:app/providers/note_prov.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/edit.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routes: {
          '/home': (context) => const Home(),
          '/edit': (context) => const Edit(),
        },
        home: const Splash(),
      ),
    );
  }
}
