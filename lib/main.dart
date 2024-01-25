import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pages/home_page.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [],);
    return MaterialApp(
      title: "Flutter Shoes",
      theme: ThemeData.dark(),
      home: const HomePageShoes(),
      debugShowCheckedModeBanner: false, // Elimina la cinta de banner de debug de la app.
    );
  }
}
