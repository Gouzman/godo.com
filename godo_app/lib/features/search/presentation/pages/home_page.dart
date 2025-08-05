import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fond en dégradé comme sur le design
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
              constraints: const BoxConstraints(
                maxWidth: 600,
              ), // Conteneur principal
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  // Assurez-vous d'avoir suivi l'étape 2.5 pour ajouter votre logo.
                  SizedBox(
                    width: 450, // Largeur prédéfinie pour le logo
                    height: 130, // Hauteur prédéfinie pour le logo
                    child: Image.asset(
                      'assets/images/logo.png', // Chemin vers votre logo
                      fit: BoxFit
                          .contain, // Assure que le logo s'adapte sans être déformé
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Slogan
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

                  // Barre de recherche
                  TextField(
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 25,
                      ),
                      hintText: 'Ex: "Envoyer de l\'argent à un ami"',
                      hintStyle: TextStyle(color: Colors.white.withAlpha(128)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white.withAlpha(179),
                        ),
                      ),
                      // Bordure stylisée
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
                  ),
                  const SizedBox(
                    height: 150,
                  ), // Espace pour pousser le footer en bas
                  // Footer
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
