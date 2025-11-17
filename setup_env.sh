#!/bin/bash

# Créer l'environnement virtuel
python3 -m venv venv

# Activer l'environnement virtuel
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source venv/bin/activate
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source venv/bin/activate
elif [[ "$OSTYPE" == "cygwin" ]]; then
    venv\Scripts\activate
elif [[ "$OSTYPE" == "msys" ]]; then
    venv\Scripts\activate
elif [[ "$OSTYPE" == "win32" ]]; then
    venv\Scripts\activate
else
    echo "Système d'exploitation non supporté"
    exit 1
fi

# Installer les dépendances
pip install numpy opencv-python Pillow pyinstaller

# Générer le fichier requirements.txt
pip freeze > requirements.txt

echo "Configuration terminee !\n Pour installer les dependances sur une autre machine, executez : pip install -r requirements.txt "
