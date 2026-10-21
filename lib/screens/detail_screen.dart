import 'package:flutter/material.dart';
import '../models/livre.dart';

class DetailScreen extends StatefulWidget {
  final Livre livre;

  const DetailScreen({super.key, required this.livre});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final livre = widget.livre;

    return Scaffold(
      appBar: AppBar(title: const Text('Détail')),
      body: SingleChildScrollView(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Couverture : 200 px de haut, couleur du livre
              Container(
                height: 200,
                width: double.infinity,
                color: livre.couleur,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Text(
                  livre.titre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Auteur'),
                subtitle: Text(livre.auteur),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Année'),
                subtitle: Text('${livre.annee}'),
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Genre'),
                subtitle: Text(livre.genre),
              ),

              // Q4.6 + Q4.8 : boutons
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        livre.favori = !livre.favori;
                      });
                    },
                    icon: Icon(
                      livre.favori ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    label: const Text('Ajouter aux favoris'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        livre.lu = !livre.lu;
                      });
                    },
                    icon: Icon(
                      livre.lu ? Icons.check_circle : Icons.check_circle_outline,
                    ),
                    label: const Text('Marquer comme lu'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}