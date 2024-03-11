# Analyse de Tuberculose via Mycobacterium tuberculosis Genomes

Ce projet vise à analyser des génomes appartenant au complexe Mycobacterium tuberculosis en utilisant des données téléchargées depuis la base de données "Genome" du NCBI. Il implique l'analyse des génomes avec Miru-Hero et l'utilisation de l'outil SpolLineages pour l'interprétation des résultats.

## Prérequis

### Installation des dépendances Python

Il est recommandé d'utiliser un environnement virtuel Python pour installer les dépendances nécessaires à ce projet. Vous pouvez installer les dépendances requises via PyPI.

- **BioPython** : Utilisé pour l'analyse bioinformatique.
  ```sh
  pip install biopython

### Miru-Hero et SpolLineages
Les exécutables pour Miru-Hero et le fichier JAR pour SpolLineages sont inclus directement dans ce dépôt. Assurez-vous que vous avez Java installé sur votre système pour exécuter SpolLineages.

## Utilisation
Les 20 génomes se trouvent dans le dossier `Genome dataset`.
Les génoypes de Mycobacterium tuberculosis peuvent être analysés en utilisant les scripts fournis dans ce dépôt. Les scripts sont conçus pour être utilisés avec des fichiers FASTA contenant des séquences de génomes bactériens.

### Analyse avec Miru-Hero et SpolLineages
Exécutez Miru-Hero sur les génomes téléchargés en utilisant le script run_analysis.sh inclus. Ce script automatisera le processus d'analyse pour chaque génome et enregistrera les résultats dans un fichier CSV.
Une fois l'analyse avec Miru-Hero terminée, il lancera SpolLineages pour interpréter les résultats de Miru-Hero.
```sh
sh script.sh
```

## Résultats
Les résultats de l'analyse Miru-Hero sont enregistrés dans un fichier CSV nommé `resultats_spolygotypes.csv`.
Les résultats de l'analyse SpolLineages sont enregistrés dans un fichier nommé `result_spolLineages.csv`.


