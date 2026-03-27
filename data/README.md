# 📊 Projet RH Analytics – PostgreSQL
Analyse RH complète basée sur SQL, modélisation de données et construction d’un dataset enrichi.  
Projet réalisé pour l’entreprise fictive **Datalendo** dans un contexte simulant une mission réelle de Data Analyst.

---

## 🧭 1. Objectif du projet
Développer une analyse RH robuste à partir de données brutes en utilisant exclusivement **PostgreSQL** :

- Construire un **dataset enrichi** (colonnes dérivées)
- Structurer l’analyse via des **vues SQL**
- Répondre à 15 questions RH clés (effectifs, turnover, performance, rétention)
- Préparer les données pour un **tableau de bord RH**

Ce projet démontre des compétences en **SQL avancé**, **data engineering**, **analyse métier**, et **documentation technique**.

---

## 🗂️ 2. Architecture des données

### 2.1. Tables sources
| Table | Rôle | Points techniques |
|-------|------|------------------|
| `employees` | Base des analyses RH | Clé primaire, dates, relations avec performance & turnover |
| `performance` | Scores annuels | Agrégations, moyennes, catégorisation |
| `turnover` | Historique des départs | Analyse du churn, taux de sortie |
| `departments` | Référentiel | Jointures pour analyses par département |

---

## 🧮 3. Colonnes dérivées (Data Engineering)
Création de nouvelles variables pour enrichir le dataset :

| Colonne | Technique SQL | Utilité |
|---------|----------------|---------|
| `anciennete` | `AGE()`, `DATE_PART()` | Analyse de séniorité |
| `score_moyen` | `AVG()` + `GROUP BY` | Performance consolidée |
| `categorie_performance` | `CASE WHEN` | Segmentation RH |
| `categorie_embauche` | Règles métier | Classification des employés |
| `cohorte_embauche` | `EXTRACT(YEAR FROM hire_date)` | Analyse de rétention par cohorte |

Ces transformations montrent la capacité à **préparer un dataset analytique complet**.

---

## 🧱 4. Vues SQL (Data Modeling)
Pour structurer l’analyse et éviter la duplication de code, plusieurs vues ont été créées :

- `vue_anciennete`  
- `vue_performance_moyenne`  
- `vue_cohortes`  
- `vue_turnover_dept`  
- `vue_dataset_enrichi` (vue finale consolidée)

Chaque vue encapsule une logique métier et facilite la construction d’un tableau de bord.

---

## 🧠 5. Scripts SQL (Livrable 1)
Les requêtes SQL sont organisées dans le dossier :

Elles couvrent :
- Agrégations
- Jointures complexes
- Fenêtres analytiques (si utilisées)
- Segmentation via `CASE`
- Calculs temporels

---

## 📈 6. Méthodologie technique

### Étape 1 — Exploration & validation des données
- Vérification des types
- Contrôle des valeurs manquantes
- Analyse des relations entre tables

### Étape 2 — Data Engineering
- Création des colonnes dérivées
- Normalisation des formats de dates
- Construction de vues modulaires

### Étape 3 — Analyse RH
- Effectifs par période
- Turnover global & par département
- Performance moyenne & distribution
- Rétention par cohorte d’embauche

### Étape 4 — Préparation pour BI
- Vue finale prête pour Power BI / Tableau
- Dataset exportable en CSV

---

## 🧰 7. Stack technique

| Outil | Usage |
|-------|--------|
| **PostgreSQL** | Requêtes, vues, transformations |
| **pgAdmin / DBeaver** | Exécution & visualisation |
| **GitHub** | Versioning & documentation |
| **Markdown** | Documentation technique |
| **Excel / CSV** | Export du dataset enrichi |

---

## 🎯 8. Compétences démontrées

- SQL avancé (agrégations, dates, CASE, vues)
- Modélisation analytique (dataset enrichi)
- Structuration de code SQL (scripts organisés)
- Analyse RH (turnover, performance, cohorte)
- Documentation technique claire (README, commentaires SQL)
- Préparation de données pour BI

---

## 💡 9. Pertinence du projet pour un recruteur data

Ce projet démontre :

- La capacité à **transformer des données brutes en insights actionnables**
- Une maîtrise solide de **PostgreSQL** dans un contexte métier réel
- Une approche **data engineering** structurée (vues, colonnes dérivées)
- Une compréhension des enjeux RH : rétention, performance, effectifs
- Une documentation professionnelle, essentielle pour le travail en équipe

---

## 📬 10. Auteur
**Mustafa – Data Analyst SQL**  
Sharjah, UAE