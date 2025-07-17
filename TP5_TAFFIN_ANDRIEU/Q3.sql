create view listeUst as (
select us.nomUst
from Ustensile us
join Utiliser ut on ut.numUst = us.numUst
join Recette r on ut.numRecette = r.numRecette
where r.nomRec = 'Blue Lagoon'
);

select * from listeUst;

create view listeIngre as (
select p.nomProd, sum(i.quantite), i.unite
from Ingredient i
join Produit p using (numProd)
where i.numRecette = (select numRecette from Recette where nomRec = 'Blue Lagoon')
group by p.nomProd, i.unite
);

select * from listeIngre;

create view listeEtape as (
select e.numEtape, e.description, p.nomProd, i.quantite, i.unite
from Etape e
join Ingredient i using (numRecette, numEtape)
join Produit p using (numProd)
where e.numRecette = (select numRecette from Recette where nomRec = 'Blue Lagoon')
);

select * from listeEtape;

