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