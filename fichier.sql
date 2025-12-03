CREATE DATABASE club;

USE club;

CREATE TABLE Abonements(
    id_abonnement  int AUTO_INCREMENT PRIMARY KEY,
    type_abonnement varchar(255) NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL
);
CREATE TABLE Memebres (
    id_member  int AUTO_INCREMENT PRIMARY KEY,
    pseudo  varchar(255) NOT NULL,
    date_join  date NOT NULL ,
    nom_membre varchar(255) NOT NULL,
    prénom_member varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    id_abonnement int,
    FOREIGN KEY (id_abonnement) REFERENCES Abonements(id_abonnement)    
);
CREATE TABLE Jeux_Video (
    id_jeux  int AUTO_INCREMENT PRIMARY KEY,
    title_jeux  varchar(255) NOT NULL,
    studio_name varchar(255) NOT NULL,
    genre varchar(255) NOT NULL,
    date_sortir  date NOT NULL 
);
CREATE TABLE Emprunts(
    id_Emp  int AUTO_INCREMENT PRIMARY KEY,
    date_start date NOT NULL, 
    date_fin date NOT NULL,
    id_member int,
    id_jeux int,
    FOREIGN KEY (id_member) REFERENCES Memebres(id_member),
    FOREIGN KEY (id_jeux) REFERENCES Jeux_Video(id_jeux)
);



CREATE TABLE Tournois(
    id_tournoi  int AUTO_INCREMENT PRIMARY KEY,
    date_start date NOT NULL, 
    date_fin date NOT NULL,
    id_jeux int ,
    FOREIGN KEY (id_jeux) REFERENCES Jeux_Video(id_jeux)
);

CREATE TABLE resultats(
    id_result int AUTO_INCREMENT PRIMARY KEY,
    score int NOT NULL,
    recompenses varchar(255) NOT NULL,
    id_member int,
    id_tournoi int, 
    FOREIGN KEY (id_member) REFERENCES Memebres(id_member),
    FOREIGN KEY (id_tournoi) REFERENCES Tournois(id_tournoi)
);

-- inser data fake in tables--
USE club;

INSERT INTO abonements(type_abonnement,date_start,date_end)
VALUES
('Mensuel', '2025-01-01', '2025-01-31'),
('Annuel', '2025-01-01', '2025-12-31'),
('Hebdomadaire', '2025-01-10', '2025-01-17');

INSERT INTO Memebres (pseudo, date_join, nom_membre, prénom_member, email, id_abonnement)
VALUES
('PlayerOne', '2025-01-05', 'Ali', 'Youssef', 'youssef.ali@example.com', 1),
('GamerGirl', '2025-01-10', 'Sara', 'El Amrani', 'sara.amrani@example.com', 2),
('NoobMaster', '2025-01-15', 'Hassan', 'Karimi', 'hassan.karimi@example.com', 1),
('ShadowBlade', '2025-01-20', 'Imane', 'Bennis', 'imane.bennis@example.com', 3);

INSERT INTO Jeux_Video (title_jeux, studio_name, genre, date_sortir)
VALUES
('FIFA 25', 'EA Sports', 'Sport', '2024-09-20'),
('Elden Ring', 'FromSoftware', 'Action-RPG', '2022-02-25'),
('Minecraft', 'Mojang', 'Sandbox', '2011-11-18'),
('Fortnite', 'Epic Games', 'Battle Royale', '2017-07-21');

INSERT INTO Emprunts (date_start, date_fin, id_member, id_jeux)
VALUES
('2025-02-01', '2025-02-05', 1, 1),
('2025-02-03', '2025-02-10', 2, 3),
('2025-02-06', '2025-02-12', 3, 2),
('2025-02-08', '2025-02-15', 4, 4);

INSERT INTO Tournois (date_start, date_fin, id_jeux)
VALUES
('2025-03-01', '2025-03-02', 1),
('2025-03-10', '2025-03-11', 4),
('2025-03-15', '2025-03-16', 2);

INSERT INTO resultats (score, recompenses, id_member, id_tournoi)
VALUES
(1500, 'Medaille d\'or', 1, 1),
(1200, 'Medaille d\'argent', 2, 1),
(900, 'Medaille de bronze', 3, 1),
(1800, 'Carte cadeau 50€', 4, 2),
(2000, 'Casque Gaming', 1, 3);

-- select update delete tri 

--Afficher le contenue de tables members--
SELECT * FROM Memebres;
--Afficher le contenue de couloum pseudo email members--
SELECT pseudo,email FROM memebres;
--change name of members where id=1 
UPDATE memebres SET nom_membre='mouna' WHERE id_member=1;
UPDATE memebres SET id_abonnement=3 WHERE id_member=2;

--Lister les informations de tous les membres (pseudo, e-mail, date d'inscription).
SELECT pseudo,email,date_join FROM memebres;

--Afficher la liste des jeux disponibles, avec leur titre, genre, et studio de développement.
SELECT title_jeux,studio_name ,genre FROM jeux_video;

--add new colum  
ALTER TABLE tournois ADD COLUMN name_tournois VARCHAR(30);

--remplir la nouvelle colum 
UPDATE tournois SET name_tournois='Game Masters Cup' WHERE id_tournoi=1;
UPDATE tournois SET name_tournois='Pro Gamer Clash' WHERE id_tournoi=2;
UPDATE tournois SET name_tournois='Championnat des Maîtres' WHERE id_tournoi=3;
SELECT * FROM tournois;

--affiche détail a partir nom 
SELECT * FROM tournois WHERE name_tournois='Championnat des Maîtres';

--use where and affiche 
SELECT*FROM memebres WHERE pseudo='ShadowBlade';
SELECT *FROM jeux_video WHERE genre='Action-RPG';
SELECT*FROM memebres WHERE id_abonnement=1;
SELECT * FROM  jeux_video ORDER BY date_sortir ASC;
SELECT*FROM memebres;
SELECT*FROM jeux_video;
SELECT pseudo,email FROM memebres;
--join 
SELECT memebres.pseudo, resultats.recompenses ,resultats.id_tournoi FROM resultats 
JOIN memebres ON resultats.id_member=memebres.id_member;

SELECT memebres.pseudo, jeux_video.title_jeux , emprunts.date_start, emprunts.date_fin FROM emprunts 
JOIN memebres ON emprunts.id_member=memebres.id_member
JOIN jeux_video ON emprunts.id_jeux=jeux_video.id_jeux;


SELECT memebres.pseudo, abonements.type_abonnement FROM memebres
JOIN abonements ON memebres.id_abonnement=abonements.id_abonnement;

SELECT*FROM jeux_video
ORDER BY studio_name ASC;
SELECT*FROM memebres
ORDER BY date_join DESC ;