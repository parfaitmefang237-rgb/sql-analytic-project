
--1. Combien d’employés sont actuellement actifs ? 1300

SELECT count(*) as totalE
FROM employes  
WHERE date_depart is null ;

WITH active_employes as (
    SELECT date_depart
    FROM employes
    WHERE date_depart is null
)
select count(*) 
from active_employes ;


--2. Combien de départs avons-nous eu sur les 12 derniers mois ? 10(avec max(date-depart), mais 66(avec max(current-date), mais ce calcul n'est pas realiste car dans turnover/employes, les date vont jusqu'a 2027, ce qui montre que ces donnees sont juste pedagogiques, et ne sauraient donc fonctionner avec current-day)

SELECT COUNT(*) AS nb_depart_12_mois
FROM employes
WHERE date_depart >= (SELECT MAX(CURRENT_date) FROM employes) - INTERVAL '12 months';


SELECT COUNT(*) AS nb_depart_12_mois
FROM turnover
WHERE date_depart >= (SELECT max(CURRENT_date) FROM employes) - INTERVAL '12 months'
;

--3. Quels départements ont le turnover le plus élevé ? 
--juridique(24)-informatique(23)-operations(23)
--direction generale(23)-data analyst(21)-marketing(20)
--rh(18)-finance(16)-service client(16)-ventes(16)

select 
    d.nom_departement, 
    count(e.date_depart) as tauxDepart
from employes e
join departements d on e.id_departement=d.id_departement  
GROUP BY  d.nom_departement
order by tauxDepart desc
;

--autre option meme resultat
select 
    d.nom_departement, 
    count(t.date_depart) as tauxDepart
from turnover t
join employes e on t.id_employe=e.id_employe
join departements d on e.id_departement=d.id_departement  
GROUP BY  d.nom_departement
order by tauxDepart desc
;

--4. Quel est le salaire moyen par département ?

select d.nom_departement,
    round(avg(e.salaire),2) salaireMOY
from employes e 
join departements d on e.id_departement=d.id_departement
group BY d.nom_departement
order by  salaireMOY desc ;

--5. Quels employés ont plus de 5 ans d’ancienneté ?

select nom,prenom,
       anciennete
from employes
where anciennete > 5 
order by anciennete desc;


--6. Classez les départements par performance moyenne trimestrielle.

--perf moyenne
select d.nom_departement, 
       round(avg(p.score),2) as performance_moyenne
from performances p
join employes e on p.id_employe=e.id_employe
join  departements d on e.id_departement=d.id_departement
group BY d.nom_departement
order BY performance_moyenne desc ;

--perf moy par trimestre et par annee
SELECT 
    d.nom_departement,
    EXTRACT(YEAR FROM p.date_evaluation) AS annee,
    EXTRACT(QUARTER FROM p.date_evaluation) AS trimestre,
    ROUND(AVG(p.score), 2) AS performance_moyenne
FROM performances p
JOIN employes e 
    ON p.id_employe = e.id_employe
JOIN departements d 
    ON e.id_departement = d.id_departement
GROUP BY 
    d.nom_departement,
    annee,
    trimestre
ORDER BY 
    d.nom_departement,
    annee,
    trimestre;

--7. Identifier les 10 meilleurs employés sur 3 derniers trimestres.

SELECT 
    e.nom,
    SUM(p.score) AS performance_totale
FROM performances p
JOIN employes e ON p.id_employe = e.id_employe
WHERE p.date_evaluation >= (
    SELECT MAX(date_evaluation) - INTERVAL '9 months'
    FROM performances
)
GROUP BY e.nom
ORDER BY performance_totale DESC
LIMIT 10;

--8. Identifier les employés les moins performants et leur département

select 
e.nom, 
d.nom_departement, 
min(p.score) as performance
from performances p
join employes e on p.id_employe = e.id_employe
join departements d on e.id_departement = d.id_departement
group BY e.nom, d.nom_departement
order BY performance asc ;


--9. Calculer la rétention moyenne par cohorte d’embauche.

WITH cohortes AS (
    SELECT
        cohorte_embauche,
        COUNT(*) AS total_embauches,
        COUNT(*) FILTER (WHERE date_depart IS NULL) AS encore_actifs,
        ROUND(
            COUNT(*) FILTER (WHERE date_depart IS NULL) * 100.0 
            / COUNT(*), 2
        ) AS taux_retention
    FROM employes
    GROUP BY cohorte_embauche
)
SELECT 
    cohorte_embauche,
    taux_retention
FROM cohortes
ORDER BY cohorte_embauche;

--10. Quels départements recrutent le plus souvent ?

select 
    d.nom_departement, 
    count(e.date_embauche) as recrutement
from employes e
join departements d 
     on e.id_departement = d.id_departement
group by d.nom_departement
order by recrutement desc;


--11. Quelle proportion des départs est volontaire vs involontaire ?


SELECT
    type_depart,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion_depart
FROM turnover
GROUP BY  type_depart
order by proportion_depart;

--departs volontaires vs involontaires par departements
SELECT
    d.nom_departement,
    t.type_depart,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION by nom_departement), 2) AS proportion_depart,
    extract(year from t.date_depart) as anee_depart
FROM turnover t
join employes e on t.id_employe = e.id_employe
join departements d on e.id_departement = d.id_departement
GROUP BY d.nom_departement, t.type_depart, anee_depart
order by proportion_depart desc;

--12. Quelle est la distribution des postes par ancienneté ?

select poste,
       CASE
           when anciennete < 2 then '0-3 ans'
           when anciennete between 4 and 5 then '4-5 ans'
           else '+6 ans'
        End as tranche_anciennete,
        count(*) as total_employes
from employes
group by poste, tranche_anciennete
order by poste, tranche_anciennete ;




--13. Quels employés n’ont pas encore reçu de feedback cette année ?

    select 
            e.id_employe,
            e.nom, 
            e.prenom
    from employes e
    left join performances p
            on e.id_employe = p.id_employe
            and extract(year from p.date_evaluation) = extract(year from CURRENT_date)
    where p.date_evaluation 
    is null
    and e.id_employe 
    is not null
    group by e.id_employe, e.nom, e.prenom ;

    --14. Segmentez les employés par niveau de performance : faible / moyen / élevé

select 
         CASE
            when score <60 then 'faible'
            when score between 60 and 80 then 'moyen'
            else 'eleve'
        End as performance_categorie,
        count(*) as total_employes
from performances  
group BY performance_categorie
order by performance_categorie desc
;

--la vue performance categorie ayant deja ete cree (POURQUOI CE RESULTAT DIFFEENT?)
select categorie_performance, 
        count(*) as total_employes
from performance_categorie
group BY categorie_performance
order by categorie_performance desc;  


--15. Générer un tableau résumé avec KPIs par département et par cohorte.

select d.nom_departement,
       e.cohorte_embauche,
       count(e.id_employe) as effectif,
       round(avg(e.salaire),2) as salaireMOY,
       round(avg(e.anciennete),2) as anciennete_moyenne,
       round(avg(pm.score_moyen),2) as score_moyen
from employes e 
join departements d on e.id_departement = d.id_departement
left join performance_moyenne pm on e.id_employe = pm.id_employe
group by d.nom_departement,e.cohorte_embauche
order by effectif,salaireMOY,anciennete_moyenne, score_moyen

        