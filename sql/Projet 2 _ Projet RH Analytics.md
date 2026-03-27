# **Projet 2 : Projet RH Analytics**

## **Contexte du projet**

Vous êtes analyste SQL chez **DataLendo**, mais cette fois vous travaillez pour le **service RH**.  
On vous fournit **4 tables principales** :

1. **employes** : informations sur les employés (id, nom, département, date d’embauche, date de départ, poste, salaire).  
2. **departements** : liste des départements, manager, budget.  
3. **performances** : évaluations trimestrielles des employés (score, date, objectifs atteints).  
4. **turnover** : informations sur les départs volontaires ou involontaires (date, raison, ancienneté).

## **Mission RH / Questions business**

Vous recevez un mail de votre manager :

Bonjour Analyste,  
Nous souhaitons avoir une vue complète sur nos effectifs et la performance. Merci de répondre aux 15 questions suivantes avec SQL et d’envoyer vos insights.

1. Combien d’employés sont actuellement actifs ?  
2. Combien de départs avons-nous eu sur les 12 derniers mois ?  
3. Quels départements ont le turnover le plus élevé ?  
4. Quel est le salaire moyen par département ?  
5. Quels employés ont plus de 5 ans d’ancienneté ?  
6. Classez les départements par performance moyenne trimestrielle.  
7. Identifier les 10 meilleurs employés sur 3 derniers trimestres.  
8. Identifier les employés les moins performants et leur département.  
9. Calculer la rétention moyenne par cohorte d’embauche.  
10. Quels départements recrutent le plus souvent ?  
11. Quelle proportion des départs est volontaire vs involontaire ?  
12. Quelle est la distribution des postes par ancienneté ?  
13. Quels employés n’ont pas encore reçu de feedback cette année ?  
14. Segmentez les employés par niveau de performance : faible / moyen / élevé.  
15. Générer un tableau résumé avec KPIs par département et par cohorte.

Les données sont disponibles ici : 

[employes.csv](https://drive.google.com/file/d/1t0xD5b6mHrQ-8HLG-4vDBSEx4HkRwon-/view?usp=drive_link)   
[departements.csv](https://drive.google.com/file/d/13HiGJLABzgLwWvHQicGEngZwiAtgHFVg/view?usp=drive_link)  
[performances.csv](https://drive.google.com/file/d/1QhnzkDoHWddC68_LjyzNdTobbi61zs8-/view?usp=drive_link)  
[turnover.csv](https://drive.google.com/file/d/1bpcZytt78TbcdOwIGY_eR7Wl4-EYJyV-/view?usp=drive_link)  

Bon travail 

## **Livrables attendus**

1. **Scripts SQL complets** : toutes les requêtes utilisées pour répondre aux questions.  
2. **Dataset enrichi** : colonnes dérivées (ancienneté, score moyen, catégorie de performance, cohorte d’embauche).  
3. **Document Insights** : synthèse des résultats et recommandations RH.  
4. **README GitHub** : expliquer les tables, transformations, hypothèses et méthodologie.  
