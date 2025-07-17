create table Categorie(
	numCategRec serial primary key,
	nomCat varchar(200) not null
);

create unique index nomCatUnique on Categorie(lower(nomCat));

create table Recette(
	numRecette serial primary key,
	numCategRec integer references Categorie(numCategRec) on delete set null ,
	nomRec varchar(200),
	nbProd integer,
	temps interval,
	constraint nbProdPositive
		check(nbProd > 0)
);

create table Ustensile(
	numUst serial primary key,
	nomUst varchar(200) not null
);

create table Utiliser(
	numUst integer references Ustensile(numUst),
	numRecette integer references Recette(numRecette),
	primary key (numUst, numRecette)
);

create table Etape(
	numEtape Integer,
	numRecette integer references Recette(numRecette) on delete cascade,
	description varchar(1000),
	primary key (numEtape, numRecette),
	constraint numEtapePositive
		check(numEtape > 0)
	
);

create table Produit(
	numProd serial primary key,
	nomProd varchar(200) not null
);

create table Ingredient(
	numIngre serial,
	numEtape integer,
	numRecette integer,
	numProd integer references Produit(numProd),
	quantite integer,
	unite varchar(20),
	primary key(numIngre, numEtape, numRecette),
	foreign key (numEtape, numRecette) references Etape(numEtape, numRecette) on delete cascade,
	constraint quantitePositive
		check(quantite > 0),
	constraint uniteValues
		check(unite = 'cl' or unite = 'g' or unite = 'c-a-s' or unite = 'c-a-c')
);