import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../models/livre.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  // Q3.2 : filtre nouveautés
  bool _nouveautesSeulement = false;

  // Q3.3 : les 5 genres, tous cochés au départ
  final Map<String, bool> _genres = {
    'Roman': true,
    'Science': true,
    'Histoire': true,
    'Jeunesse': true,
    'Informatique': true,
  };

  // Q3.6 : true si tout est coché, false si rien, null sinon
  bool? get _tousLesGenres {
    final valeurs = _genres.values;
    if (valeurs.every((v) => v)) return true;
    if (valeurs.every((v) => !v)) return false;
    return null;
  }

  // Q3.7 : livres filtrés par genre (et par nouveauté si demandé)
  List<Livre> get _livresFiltres => livres
      .where((l) =>
          _genres[l.genre] == true &&
          (!_nouveautesSeulement || l.nouveaute))
      .toList();

  // Q3.4 : une icône par genre
  IconData _iconeGenre(String genre) {
    switch (genre) {
      case 'Roman':
        return Icons.menu_book;
      case 'Science':
        return Icons.science;
      case 'Histoire':
        return Icons.history_edu;
      case 'Jeunesse':
        return Icons.child_care;
      case 'Informatique':
        return Icons.computer;
      default:
        return Icons.book;
    }
  }

  @override
  Widget build(BuildContext context) {
    final affiches = _livresFiltres;
    final lus = affiches.where((l) => l.lu).length;

    return Scaffold(
      // Q3.8 : compteur dynamique
      appBar: AppBar(title: Text('Lus : $lus / ${affiches.length}')),
      body: ListView(
        children: [
          // Q3.2 : un seul CheckboxListTile avec setState
          CheckboxListTile(
            title: const Text('Afficher uniquement les nouveautés'),
            value: _nouveautesSeulement,
            onChanged: (bool? valeur) {
              setState(() {
                _nouveautesSeulement = valeur ?? false;
              });
            },
          ),

          // Q3.6 : case « Tous les genres » à trois états
          CheckboxListTile(
            title: const Text(
              'Tous les genres',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            tristate: true,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.indigo,
            value: _tousLesGenres,
            onChanged: (_) {
              // si tout est déjà coché, on décoche tout, sinon on coche tout
              final nouvelle = _tousLesGenres != true;
              setState(() {
                for (final genre in _genres.keys) {
                  _genres[genre] = nouvelle;
                }
              });
            },
          ),
          const Divider(),

          // Q3.3 + Q3.4 + Q3.5 : cases générées à partir de la Map
          ..._genres.keys.map((genre) {
            final nombre = livres.where((l) => l.genre == genre).length;
            return CheckboxListTile(
              title: Text(genre),
              subtitle: Text('$nombre livres'),
              secondary: Icon(_iconeGenre(genre)),
              activeColor: Colors.indigo,
              controlAffinity: ListTileControlAffinity.leading,
              value: _genres[genre],
              onChanged: (bool? valeur) {
                setState(() {
                  _genres[genre] = valeur ?? false;
                });
              },
            );
          }),

          const Divider(),

          // Q3.7 : liste des livres filtrés, avec titre barré si lu
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: affiches.length,
            itemBuilder: (context, index) {
              final livre = affiches[index];
              return CheckboxListTile(
                title: Text(
                  livre.titre,
                  style: TextStyle(
                    decoration:
                        livre.lu ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(livre.auteur),
                controlAffinity: ListTileControlAffinity.leading,
                value: livre.lu,
                onChanged: (bool? valeur) {
                  setState(() {
                    livre.lu = valeur ?? false;
                  });
                },
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(height: 1),
          ),
        ],
      ),
    );
  }
}