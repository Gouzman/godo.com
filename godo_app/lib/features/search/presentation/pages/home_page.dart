import 'package:flutter/material.dart';
import 'package:godo_app/features/search/presentation/pages/search_results_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Contrôleur pour lire le contenu du TextField
  final _searchController = TextEditingController();

  @override
  void dispose() {
    // Toujours libérer le contrôleur quand le widget est détruit
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      // Ajout d'un print pour le débogage, visible dans la console du terminal
      print('Performing search for: $query');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(query: query),
        ),
      );
    } else {
      print('Search query is empty.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B3E), Color(0xFF162A5A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48.0,
              ),
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 90,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Que voulez-vous faire ?',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 25,
                      ),
                      hintText: 'Ex: "Envoyer de l\'argent à un ami"',
                      hintStyle: TextStyle(
                        color: Colors.white.withAlpha((0.5 * 255).toInt()),
                      ),
                      // On remplace le prefixIcon par un suffixIcon cliquable
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.white.withAlpha((0.7 * 255).toInt()),
                        onPressed:
                            _performSearch, // On appelle la même fonction
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.white.withAlpha((0.5 * 255).toInt()),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),
                    ),
                    // On garde onSubmitted pour ceux qui préfèrent utiliser "Entrée"
                    onSubmitted: (_) => _performSearch(),
                  ),
                  const SizedBox(height: 150),
                  const Text(
                    '© 2025 NascentiaTechnologie. Tous droits réservés',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
