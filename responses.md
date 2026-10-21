#Q0.8: Pourquoi ne faut-il jamais envoyer ces dossiers sur GitHub ?
Ils contiennent des fichiers générés automatiquement,que n’importe qui peut recréer avec flutter pub get et flutter run. 

#Q1.2
si on supprime, ontap "monprofil" n'est plus cliquable 

#Q1.4
dense: la ligne est un peu plus basse et le text plus petit
isThreeLine: un tout petit changemet sur l'hauteur de la ligne
enabled: il devient plus visible, le texte et l'icone deviennent gris

#question de reflexion
//quelle est la différence entre leading et trailing ?
 leading est le widget placé au début de la ligne (à gauche en français) : en général une icône ou un avatar qui identifie l'élément. trailing est le widget placé à la fin de la ligne (à droite) : en général une information secondaire ou une action, comme une note, une flèche

 //pourquoi un ListTile doit-il être placé dans un parent à largeur contrainte ?
 car un ListTile répartit lui-même l'espace horizontal entre leading, title, subtitle et trailing. 

 #Q2.1
le message :  Une Column ne défile pas. Quand les éléments sont plus hauts que l’écran, ils débordent et Flutter affiche la bande jaune et noire

#2.3 avec Divider()un trait sépare chaque ligne et avec ListTile.divideTiles(context: context, tiles: [...]).toList() il sont automatiquement ajouter il ne faut pas les aujouter par main aprés chaque list

#Q2.5 : ListView(children) construit tous les éléments d'un coup, même ceux qu'on ne voit pas. ListView.builder ne construit que les éléments visibles, donc il reste fluide avec 1 000 livres

#Q2.8: Sans Expanded, on a l'erreur "Vertical viewport was given unbounded height". La Column donne une hauteur infinie au ListView, donc Expanded lui donne l'espace restant

#Q2.9: shrinkWrap donne au ListView la hauteur de son contenu et NeverScrollableScrollPhysics bloque son défilement. On l'utilise pour une petite liste dans une page qui défile déjà

#3.1: StatelessWidget ne peut pas changer aprés sa creation, d'ou l'ecrant doit ce mettre a jour quand on coche une case  donc il faut un StatefulWidget avec setState.

#3.2:si on oublie setState, la variable change mais l'écran n'est pas redessiné, donc la case ne se coche pas visuellement.