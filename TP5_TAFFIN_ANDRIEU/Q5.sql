insert into Categorie values(10, 'apero');
insert into Recette(numCategRec, nomRec) values (10, 'chips');
delete from Categorie where nomCat = 'apero'; -- numCategRec devient null a la suppression de la catégorie

insert into Etape(numEtape, numRecette) values 
(1, (select numRecette from Recette where nomRec = 'chips'));

insert into Produit(nomProd) values('patate');

insert into Ingredient(numRecette, numEtape, numProd) values 
((select numRecette from Recette where nomRec = 'chips'), 1, (select numProd from Produit where nomProd = 'patate'));

delete from Recette where nomRec = 'chips'; -- on delete cascade a supprimé les etapes et les ingrédients associés
