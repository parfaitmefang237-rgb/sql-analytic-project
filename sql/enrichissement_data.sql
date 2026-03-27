
--anciennete des employes(annees)

alter table employes
add column anciennete int ;

update employes
set anciennete = 
     EXTRACT(YEAR from AGE(coalesce(date_depart, CURRENT_date),date_embauche));

 --cohorte embauche

ALTER TABLE employes
    add column cohorte_embauche int ;

UPDATE employes
    SET cohorte_embauche = 
    EXTRACT(YEAR FROM date_embauche);  


 --creation score moyen par employe

CREATE  VIEW performance_moyenne AS 
SELECT  id_employe,
        round(avg(score),2) AS score_moyen 
from performances 
group BY id_employe ;


--categorie de performance
CREATE VIEW performance_categorie AS 
SELECT  p.id_employe , 
        p.score_moyen,
    CASE 
        when  p.score_moyen < 60 then 'Faible'
        when  p.score_moyen between 60 and 80 then 'Moyen'
        else 'Elevée'
    end as categorie_performance
from performance_moyenne p ;

