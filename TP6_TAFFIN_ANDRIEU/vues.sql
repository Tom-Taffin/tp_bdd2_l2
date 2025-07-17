select * 
from etape
natural join ingredient;

select *
from etape e
join ingredient i on e.numetape = i.numetape and e.numrecette = i.numrecette;

-- Q1
-- natural join ne conserve pas les colonnes en doublons

-- Q2
-- les étapes sans ingrédients ne sont pas affichées car lorque l'ingredient est null, il n'est pas affiché (il aurait fallu utiliser left join)

-- Q3
select *
from etape e
natural left join ingredient i
order by numrecette, numetape;

-- Q4
create view vue_etape as (
select *
from etape e
natural left join ingredient i 
left join produit p using (numProd)
);
select * from vue_etape;

-- Q5
select r.nomrec , r.nbprod, r.temps , description, quantite, unite, nomProd
from vue_etape ve
join recette r using (numRecette)
join categorie c using (numCategRec)
where c.nomcat = 'cocktail'
order by numrecette, numetape;

-- Q5bis
create view nb_prod_par_etape as (
select numrecette, numetape, count(i.numingre) as nbProdEtape
from etape e
natural left join ingredient i
group by numrecette, numetape
order by numrecette, numetape
);

select * from nb_prod_par_etape;

select r.nomrec , r.nbprod, r.temps , description, nbProdEtape,  quantite, unite, nomProd
from vue_etape ve
join recette r using (numRecette)
join categorie c using (numCategRec)
natural join nb_prod_par_etape n
where c.nomcat = 'cocktail'
order by numrecette, numetape;
