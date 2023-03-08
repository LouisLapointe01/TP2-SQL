DROP TABLE Groupe CASCADE CONSTRAINTS;
DROP TABLE Fonction CASCADE CONSTRAINTS;
DROP TABLE Personne CASCADE CONSTRAINTS;
DROP TABLE Avis CASCADE CONSTRAINTS;
DROP TABLE Emission CASCADE CONSTRAINTS;
DROP TABLE Chaine CASCADE CONSTRAINTS;
DROP TABLE Intervenir CASCADE CONSTRAINTS;
DROP TABLE Diffuser CASCADE CONSTRAINTS;

CREATE TABLE Groupe 
(NomG VARCHAR2(50),
DateCreationG DATE, 
CONSTRAINT pk_Nomg PRIMARY KEY (NomG),
CONSTRAINT ck_Nomg CHECK (NomG IS NOT NULL));


CREATE TABLE Fonction
(NomF VARCHAR2(50),
CONSTRAINT pk_NomF PRIMARY KEY (NomF),
CONSTRAINT ck_NomF CHECK (NomF IS NOT NULL));

CREATE TABLE Personne
(NumP VARCHAR2(50),
Nom VARCHAR2(50),
Prenom VARCHAR2(50),
CONSTRAINT pk_NumP PRIMARY KEY (NumP),
CONSTRAINT ck_NumP CHECK (NumP IS NOT NULL));

CREATE TABLE Avis 
(Num NUMBER,
Description VARCHAR2(200),
Note NUMBER,
CONSTRAINTS pk_Num PRIMARY KEY (Num),
CONSTRAINTS ck_Nul CHECK (Num IS NOT NULL)); /* TEST*/

CREATE TABLE Emission
(Reference NUMBER,
Titre VARCHAR2(50),
Resume VARCHAR2(400),
Type VARCHAR2(50),
Duree VARCHAR2(50),
Num NUMBER,
NomG VARCHAR2(50),
CONSTRAINT pk_Reference PRIMARY KEY (Reference),
CONSTRAINT fk_Avis_Emission_Num FOREIGN KEY (Num) REFERENCES Avis,
CONSTRAINT fk_Groupe_Emission_NomG FOREIGN KEY (NomG) REFERENCES Groupe);

CREATE TABLE Chaine
(NomCH VARCHAR2(50),
DateCreationCH DATE,
NomG VARCHAR2(50),
CONSTRAINT pk_NomCH PRIMARY KEY (NomCH),
CONSTRAINT fk_Groupe_Chaine_NomG FOREIGN KEY (NomG) REFERENCES Groupe);


CREATE TABLE Intervenir
(NumP VARCHAR2(50),
NomF VARCHAR2(50),
CONSTRAINT pk_Intervenir PRIMARY KEY (NumP, NomF),
CONSTRAINT fk_Personne_Intervenir_NumP FOREIGN KEY (NumP) REFERENCES Personne,
CONSTRAINT fk_Fonction_Intervenir_NomF FOREIGN KEY (NomF) REFERENCES Fonction);

    
CREATE TABLE Diffuser
(HeureFin VARCHAR2(50),
Reference NUMBER,
NomCH VARCHAR2(50),
HeureDebut VARCHAR2(50),
DateDiffuser DATE, 
CONSTRAINT pk_Diffuser PRIMARY KEY (Reference, NomCH, HeureDebut, DateDiffuser),
CONSTRAINT fk_Emission_Diffuser_Reference FOREIGN KEY (Reference) REFERENCES Emission,
CONSTRAINT fk_Chaine_Diffuser_NomCH FOREIGN KEY (NomCH) REFERENCES Chaine);    


INSERT INTO Groupe(NomG)
    Values('TV1');
INSERT INTO Personne (NumP, Nom, Prenom)
    Values(999,'Vié','Jean');
INSERT INTO Fonction(NomF)
    Values('Animateur');
INSERT INTO Avis (Num,Description,Note)
    Values(111,'Bof Bof',1);
INSERT INTO Chaine (NomCH,NomG)
    Values('CH1','TV1');   
INSERT INTO Intervenir (NumP,NomF)
    Values(999,'Animateur');    
INSERT INTO Emission (Reference, Titre, Resume, Type, Duree, Num, NomG)
    Values(1,'Test1','Émission fictive','Régulier','30 Minutes',111,'TV1');
INSERT INTO Diffuser(Reference, NomCH, HeureDebut, DateDiffuser)
    Values(1,'CH1','18h','14/01/2016');
    