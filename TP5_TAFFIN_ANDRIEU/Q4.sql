insert into Categorie values(4); -- nomCat ne doit pas être null

insert into Categorie(nomCat) values('cocktail'); -- la catégorie cocktail existe déjà

insert into Ustensile values (1); -- nomUst ne doit pas être null

insert into Recette(nbProd) values (0); -- nbProd strictement positif

insert into Etape(numEtape, numRecette) values 
(0, (select numRecette from Recette where nomRec = 'Blue Lagoon')); -- numEtape strictement positif

insert into Produit(numProd) values(10); -- nomProd ne doit pas être null

insert into Ingredient(numRecette, numEtape, quantite) values 
((select numRecette from Recette where nomRec = 'Blue Lagoon'), 5, 0); -- quantite strictement positif

insert into Ingredient(numRecette, numEtape, unite) values 
((select numRecette from Recette where nomRec = 'Blue Lagoon'), 1, 'dl'); -- unite fausse

delete from Recette where nomRec = 'Blue Lagoon'; -- on delete restrict par défaut empeche la suppression de la recette Blue Lagoon car elle est référencée dans la table Utiliser

-- Les contraintes des clés primaires (unique et not null) n'ont pas été vérifiées car elles son triviales


