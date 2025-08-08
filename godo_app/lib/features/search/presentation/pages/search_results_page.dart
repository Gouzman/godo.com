import 'package:flutter/material.dart';

// Classe factice pour simuler nos données.
class MockAppResult {
  final String name;
  final String description;
  final String iconUrl;

  MockAppResult({
    required this.name,
    required this.description,
    required this.iconUrl,
  });
}

class SearchResultsPage extends StatefulWidget {
  final String query;
  const SearchResultsPage({super.key, required this.query});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late final TextEditingController _searchController;
  bool _showValidated = true; // Pour gérer le filtre

  // Données factices pour l'affichage
  final List<MockAppResult> _results = List.generate(12, (index) {
    final apps = [
      MockAppResult(
        name: "Orange Money",
        description: "Transferts d'argent, paiements, recherches",
        iconUrl:
            "[https://placehold.co/60x60/f57c00/FFFFFF?text=O](https://placehold.co/60x60/f57c00/FFFFFF?text=O)",
      ),
      MockAppResult(
        name: "Wave CI",
        description: "Transferts d'argent, paiements, recherches",
        iconUrl:
            "[https://placehold.co/60x60/00bcd4/FFFFFF?text=W](https://placehold.co/60x60/00bcd4/FFFFFF?text=W)",
      ),
      MockAppResult(
        name: "Moov Money",
        description: "Transferts d'argent, paiements, recherches",
        iconUrl:
            "[https://placehold.co/60x60/0277bd/FFFFFF?text=M](https://placehold.co/60x60/0277bd/FFFFFF?text=M)",
      ),
    ];
    return apps[index % apps.length];
  });

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.query);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010), // Fond sombre pour l'app bar
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Logo
            const Text(
              "Godo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 40),
            // Barre de recherche
            Expanded(
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintStyle: TextStyle(
                      color: Colors.white.withAlpha((0.5 * 255).toInt()),
                    ),
                    prefixIcon: Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white.withAlpha((0.7 * 255).toInt()),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white70),
                      onPressed: () {
                        /* Relancer la recherche */
                      },
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
                ),
              ),
            ),
          ],
        ),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.query,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Consultez ce guide rapide pour savoir comment faire",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          _FilterChip(
                            label: "App validés",
                            isSelected: _showValidated,
                            onTap: () => setState(() => _showValidated = true),
                          ),
                          const SizedBox(width: 12),
                          _FilterChip(
                            label: "App non validés",
                            isSelected: !_showValidated,
                            onTap: () => setState(() => _showValidated = false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400.0,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 3.5,
                  ),
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    return _AppResultCard(result: _results[index]);
                  }, childCount: _results.length),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: const Text(
                    '© 2025 NascentiaTechnologie. Tous droits réservés',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget pour les puces de filtre
class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black87 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Widget pour la carte de résultat
class _AppResultCard extends StatelessWidget {
  final MockAppResult result;
  const _AppResultCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.1 * 255).toInt()),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            result.iconUrl,
            width: 48,
            height: 48,
            errorBuilder: (c, o, s) => const Icon(Icons.business, size: 48),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result.name,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  result.description,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text("Voir"),
          ),
        ],
      ),
    );
  }
}
