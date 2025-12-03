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




