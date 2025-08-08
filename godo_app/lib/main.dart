import 'package:flutter/material.dart';
import 'package:godo_app/features/search/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Godo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily:
            'Inter', // Assurez-vous d'ajouter la police dans pubspec.yaml
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // On charge directement la page d'accueil
    );
  }
}
