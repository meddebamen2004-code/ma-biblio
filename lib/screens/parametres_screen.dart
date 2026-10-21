import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children:  ListTile.divideTiles(
          context:context,
          tiles: [
          // Q1.1 / Q1.2 : Mon profil
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mon profil'),
            subtitle: const Text('Nom, e-mail, mot de passe'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profil sélectionné')),
              );
            },
          ),


          // Q1.3 + Q1.5 : Notifications personnalisé
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            tileColor: Colors.indigo.shade50,
            iconColor: Colors.indigo,
            textColor: Colors.indigo.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),


          // Q1.3 : Langue
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            subtitle: Text('Français'),
          ),


          // Q1.3 + Q1.4 
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            subtitle: Text('MaBiblio version 1.0\nTP Listes et grilles'),
            dense: true,        // Effet : la ligne est un peu plus basse et le text plus petit
            isThreeLine: true,  // Effet : un tout petit changemet sur l'hauteur de la ligne
            enabled: false,     // Effet : il devient plus visible, le texte et l'icone deviennent gris
          ),
          for (int i = 1; i <= 10; i++)
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Option $i'),
            ),  
        ],
        ).toList(),
      ),
    );
  }
}