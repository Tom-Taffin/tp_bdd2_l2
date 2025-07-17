insert into Produit(nomProd) values
('vodka'),
('curacao bleu'),
('jus de citrons');

insert into Categorie(nomCat) values
('cocktail');

insert into Ustensile(nomUst) values
('broyeur à glace'),
('passoire'),
('shaker'),
('verre à martini');

insert into Recette(numCategRec,nomRec) values
((select numCategRec from Categorie where nomCat = 'cocktail'),'Blue Lagoon');

insert into Utiliser values
((select numUst from Ustensile where nomUst = 'broyeur à glace'), (select numRecette from Recette where nomRec = 'Blue Lagoon')),
((select numUst from Ustensile where nomUst = 'passoire'), (select numRecette from Recette where nomRec = 'Blue Lagoon')),
((select numUst from Ustensile where nomUst = 'shaker'), (select numRecette from Recette where nomRec = 'Blue Lagoon')),
((select numUst from Ustensile where nomUst = 'verre à martini'), (select numRecette from Recette where nomRec = 'Blue Lagoon'));

insert into Etape values
(1, (select numRecette from Recette where nomRec = 'Blue Lagoon'), 'mettre les ingredients dans le shaker puis shakez'),
(2, (select numRecette from Recette where nomRec = 'Blue Lagoon'), 'filtrez'),
(3, (select numRecette from Recette where nomRec = 'Blue Lagoon'), 'remplir le verre de glace pilee'),
(4, (select numRecette from Recette where nomRec = 'Blue Lagoon'), 'servez');

insert into Ingredient(numEtape, numRecette, numProd, quantite, unite) values
(1, (select numRecette from Recette where nomRec = 'Blue Lagoon'), (select numProd from Produit where nomProd = 'vodka'), 4, 'cl'),
(1, (select numRecette from Recette where nomRec = 'Blue Lagoon'), (select numProd from Produit where nomProd = 'curacao bleu'), 3, 'cl'),
(1, (select numRecette from Recette where nomRec = 'Blue Lagoon'), (select numProd from Produit where nomProd = 'jus de citrons'), 2, 'cl');
(4, (select numRecette from Recette where nomRec = 'Blue Lagoon'), (select numProd from Produit where nomProd = 'jus de citrons'), 1, 'cl');

update Recette set nbProd = (
select count(distinct p.numProd)
from Produit p
join Ingredient i on i.numProd = p.numProd
where i.numRecette = (select numRecette from Recette where nomRec = 'Blue Lagoon'))
where nomRec = 'Blue Lagoon';
