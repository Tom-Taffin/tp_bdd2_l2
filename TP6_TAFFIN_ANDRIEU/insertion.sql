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

insert into Recette(numCategRec,nomRec, temps) values
((select numCategRec from Categorie where nomCat = 'cocktail'),'Blue Lagoon', '00:05:00');

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
(1, (select numRecette from Recette where nomRec = 'Blue Lagoon'), (select numProd from Produit where nomProd = 'jus de citrons'), 2, 'cl'),
(4, (select numRecette from Recette where nomRec = 'Blue Lagoon'), (select numProd from Produit where nomProd = 'jus de citrons'), 1, 'cl');

update Recette set nbProd = (
select count(distinct p.numProd)
from Produit p
join Ingredient i on i.numProd = p.numProd
where i.numRecette = (select numRecette from Recette where nomRec = 'Blue Lagoon'))
where nomRec = 'Blue Lagoon';

insert into Produit (nomProd) values
('martini'),
('olive'),
('citron');

insert into Ustensile(nomUst) values
('verre en cristal');

insert into Recette(numCategRec, nomRec, temps) values
((select numCategRec from Categorie where nomCat = 'cocktail'), 'Cocktail James Bond', '00:02:00');

insert into Utiliser(numUst, numRecette) values
((select numUst from Ustensile where nomUst = 'shaker'), (select numRecette from Recette where nomRec = 'Cocktail James Bond')),
((select numUst from Ustensile where nomUst = 'verre en cristal'), (select numRecette from Recette where nomRec = 'Cocktail James Bond'));

insert into Etape(numEtape, numRecette, description) values
(1, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), 'Versez la vodka et le martini dans un shaker rempli de glace.'),
(2, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), 'Secouez énergiquement.'),
(3, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), 'Versez dans un verre en filtrant la glace.'),
(4, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), 'Ajoutez les olives et le citron.'),
(5, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), 'Servez immédiatement!');

insert into Ingredient(numEtape, numRecette, numProd, quantite, unite) values
(1, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), (select numProd from Produit where nomProd = 'vodka'), 6, 'cl'),
(1, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), (select numProd from Produit where nomProd = 'martini'), 1, 'cl'),
(4, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), (select numProd from Produit where nomProd = 'olive'), 1, 'c-a-c'),
(4, (select numRecette from Recette where nomRec = 'Cocktail James Bond'), (select numProd from Produit where nomProd = 'citron'), 1, 'c-a-s');

update Recette set nbProd = 4 where numRecette = (select numRecette from Recette where nomRec = 'Cocktail James Bond');