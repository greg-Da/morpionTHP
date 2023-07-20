# Morpion

Jeu de morpion en ruby qui se joue à 2.
Pour lancer le jeu `ruby app.rb`.
Pour jouer il suffit de rentrer la colonne suivi de la ligne pour jouer sur cette case:
ex: `a1` / `b3` / `c2`

## class Game

Classe qui joue le role de chef d'orchestre, permet de lancer une partie et de la suivre tout du long


## class Board

Classe qui permet de créer / afficher un plateau de jeu et verifie si les mouvements sont valides et les condition de fin de jeu (victoire / match nul)


## class Player

Classe qui permet d instancier des joueurs et d'afficher les messages specifique à un joueur 