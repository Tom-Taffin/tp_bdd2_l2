Taffin Tom
Foster Oliver


Exo1 : 
Chaque cycliste est relié à une course par l'entité fiche qui indique si le cycliste a signé la fiche de présence, le temps efféctué par le cycliste ainsi que son rang sur cette course. 
Chaque course a des bonus et des pénalités qui lui son spécifique.
Nous les avons séparé en deux entités car les bonus ne peuvent s'appliquer que a une fiche tandis que les pénalités peuvent s'appliquer sur plusieurs fiches.

Exo2:
L'entité Recette possède la propriété temps. Son Type est une entité dont les instances sont entrée, plat, desert, cocktails.
L'entité Etape représente les différentes étapes qui compose la recette. L'entité Etape est en relation avec les ustensiles ainsi qu'avec les ingrédients nécessaires.
L'entité Ingrédient est définie par une quantité d'une certaine mesure d'un certain produit.
Nous avons choisi de ne pas mettre en relation Recette avec Ingrédient et Ustensile afin d éviter les incohérences.
Les ingrédients et les ustensiles de la recette pourront être généré avec une commande sql.