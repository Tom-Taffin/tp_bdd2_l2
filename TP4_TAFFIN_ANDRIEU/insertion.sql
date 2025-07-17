insert into Lycee values 
(1, 'Bahut', 'Lille'),
(2, 'Céely', 'Lille');

insert into Personne values 
(1, 'Pupin', 'Maude', 'maude.pupin@univ-lille.fr'),
(2, 'Noe', 'Laurent', 'laurent.noe@univ-lille.fr'),
(3, 'Demon', 'Samuel', 'samuel.demon.etu@univ-lille.fr'),
(4, 'Charonov', 'Andrei', 'andrei.charonov.etu@univ-lille.fr');

insert into Enseignant values 
(1, 1),
(2, 2);

insert into Lyceen values 
(1, 3, 1);

insert into Etudiant values 
(1, 4);

insert into Visite values 
(1, 'Visite 1', '2025-01-31', '08:00:00', '11:30:00', 1, 1),
(2, 'Visite 2', '2025-01-31', '14:00:00', '17:30:00', 2, 1);

insert into Categorie values 
(1, 'programmation');

insert into UE values 
(1, 'ASD', 1),
(2, 'POO', 1);

insert into Participe values 
(1, 1),
(1, 2),
(2, 1);

insert into Suivre values 
(1, 1),
(2, 1);

insert into Inscription values
(1, 1, '2025-01-30', 'Je suis motivé.');

insert into Intervention values
(1, 1, '02:00:00', 12, 1, 1, 1),
(2, 2, '01:00:00', 13, 1, 2, 1),
(3, 1, '01:00:00', 21, 2, 1, 1),
(4, 2, '01:30:00', 22, 2, 2, 1);