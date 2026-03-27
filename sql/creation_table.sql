--creation table departements
    create table departements(
    id_departement INT PRIMARY KEY,
    nom_departement VARCHAR(100),
    manager VARCHAR(100),
    budget NUMERIC
    );

--creation table employes
create table employes(
    id_employe	INT PRIMARY KEY,
    nom	VARCHAR(100),
    prenom	VARCHAR(100),
    poste	VARCHAR(100),
    id_departement INT,
    date_embauche	date,
    date_depart	date,
    salaire NUMERIC,
    FOREIGN KEY (id_departement) REFERENCES departements (id_departement)
);

--creation table performances
create table performances(
    id_performance	int primary KEY,
    id_employe	int,
    date_evaluation date,	
    score	INT,
    objectifs_atteints BOOLEAN,
    FOREIGN KEY (id_employe) REFERENCES employes (id_employe)
);

--creation table turnover
create table turnover(
    id_depart	INT PRIMARY KEY,
    id_employe	INT ,
    date_depart	DATE ,
    type_depart	VARCHAR(100),
    anciennete INT,
    FOREIGN KEY ( id_employe) REFERENCES employes ( id_employe)

);