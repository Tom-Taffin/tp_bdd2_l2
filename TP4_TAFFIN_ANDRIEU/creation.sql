create table Lycee(
	numLycee serial primary key,
	ville varchar(50) not null
);

create table Categorie(
	numCategorie serial primary key,
	nom varchar(50) not null
);

create table Personne(
	numPersonne serial primary key,
	nom varchar(50) not null,
	prenom varchar(50) not null,
	mail varchar(200) not null
);

create table Lyceen(
	numLyceen serial primary key,
	numPersonne integer not null unique references Personne(numPersonne),
	numLycee integer not null references Lycee(numLycee)
);

create table Etudiant(
	numEtudiant serial primary key,
	numPersonne integer not null unique references Personne(numPersonne)
);

create table Enseignant(
	numEnseignant serial primary key,
	numPersonne integer not null unique references Personne(numPersonne)
);

create table UE(
	numUE serial primary key,
	titre varchar(100) not null,
	numCategorie integer not null references Categorie(numCategorie)
);

create table Visite(
	numVisite serial primary key,
	titre varchar(100) not null,
	dateVisite date not null,
	heureDebut time not null,
	heureFin time not null,
	numLycee integer not null references Lycee(numLycee),
	numEnseignant integer not null references Enseignant(numEnseignant),
	check (heureDebut < heureFin)
);

create table Inscription(
	numVisite integer references Visite(numVisite),
	numLyceen integer references Lyceen(numLyceen),
	dateInscription date not null,
	motivations text not null,
	primary key (numVisite, numLyceen)
);

create table Participe(
	numUE integer references UE(numUE),
	numEnseignant integer references Enseignant(numEnseignant),
	primary key (numUE, numEnseignant)
);

create table Suivre(
	numUE integer references UE(numUE),
	numEtudiant integer references Etudiant(numEtudiant),
	primary key (numUE, numEtudiant)
);

create table Intervention(
	numIntervention serial,
	ordrePassage integer not null,
	duree time not null,
	salle integer not null,
	numVisite integer references Visite(numVisite) on delete cascade,
	numUE integer not null references UE(numUE),
	numEtudiant integer not null references Etudiant(numEtudiant),
	primary key (numIntervention, numVisite)
);









