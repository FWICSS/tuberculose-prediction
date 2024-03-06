#!/bin/bash

dossier_racine="./Genome dataset/ncbi_dataset/"


fichier_sortie="resultats_spolygotypes.csv"
jarPath="SpolLineages.jar"
outputFile="result_spolLineages.csv"

if [ -f "$fichier_sortie" ]; then
    rm "$fichier_sortie"
fi

find "$dossier_racine" -type f -name "*.fna" | while read fichier
do

    spolygotype=$(./miru-hero/MiruHero "$fichier" | grep 'Spoligotype' | awk '{print $2}')

    nom_fichier=$(basename "$fichier" .fna)

    echo "${nom_fichier};${spolygotype};" >> "$fichier_sortie"
    rm -f "${nom_fichier}.positions.tsv" "${nom_fichier}.summary.tsv"
done




echo "Traitement terminé. Les résultats sont enregistrés dans $fichier_sortie."

java -jar "$jarPath" -i "$fichier_sortie" -o "$outputFile"

echo "Traitement avec l'outil SpolLineages est terminé. Les résultats sont enregistrés dans $outputFile."