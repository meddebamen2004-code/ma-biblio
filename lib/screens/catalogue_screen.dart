import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../widgets/livre_card.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Q2.7 : on garde uniquement les livres marqués nouveauté
    final nouveautes = livres.where((l) => l.nouveaute).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(
            'Nouveautés',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        // Liste horizontale : 160 px de haut
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: nouveautes.length,
            itemBuilder: (context, index) {
              final livre = nouveautes[index];
              return Container(
                width: 110,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: livre.couleur,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  livre.titre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Tout le catalogue',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),


        
        // Q2.5 : ListView(children) construit tous les éléments d'un coup, même ceux qu'on ne voit pas. ListView.builder ne construit que les éléments visibles, donc il reste fluide avec 1 000 livres.
        Expanded(
          child: ListView.separated(
            itemCount: livres.length,
            itemBuilder: (context, index) => livreTile(livres[index]),
            separatorBuilder: (context, index) => const Divider(indent: 72),
          ),
        ),
      ],
    );
  }
}