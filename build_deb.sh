#!/bin/bash

# Nom du paquet
PACKAGE_NAME="imgfastedit"
VERSION="1.0"
ARCH="all"
DESCRIPTION="Traitez vos images facilement et rapidement"
MAINTAINER="Aliou Mbengue <mbengue.tech@gmail.com>"

# Créer les répertoires nécessaires
echo "Création des répertoires nécessaires..."
mkdir -p ${PACKAGE_NAME}_${VERSION}/DEBIAN
mkdir -p ${PACKAGE_NAME}_${VERSION}/usr/bin
mkdir -p ${PACKAGE_NAME}_${VERSION}/usr/share/applications
mkdir -p ${PACKAGE_NAME}_${VERSION}/usr/share/icons/hicolor/48x48/apps

# Copier l'exécutable et l'icône
echo "Préparation des fichiers de l'application.... "
cp dist/imgfastedit ${PACKAGE_NAME}_${VERSION}/usr/bin/${PACKAGE_NAME}
cp assets/ico/Fast_Edit.ico ${PACKAGE_NAME}_${VERSION}/usr/share/icons/hicolor/48x48/apps/${PACKAGE_NAME}.ico

# Rendre l'exécutable exécutable
chmod +x ${PACKAGE_NAME}_${VERSION}/usr/bin/${PACKAGE_NAME}

# Créer le fichier de contrôle
echo "Création du paquet DEBIAN: ${PACKAGE_NAME}_${VERSION}.deb .... "
cat <<EOF > ${PACKAGE_NAME}_${VERSION}/DEBIAN/control
Package: ${PACKAGE_NAME}
Version: ${VERSION}
Architecture: ${ARCH}
Maintainer: ${MAINTAINER}
Description: ${DESCRIPTION}
EOF

# Créer le fichier .desktop
cat <<EOF > ${PACKAGE_NAME}_${VERSION}/usr/share/applications/${PACKAGE_NAME}.desktop
[Desktop Entry]
Name=ImgFastEdit
Comment=Traitez vos images facilement et rapidement
Exec=/usr/bin/${PACKAGE_NAME}
Icon=/usr/share/icons/hicolor/48x48/apps/${PACKAGE_NAME}.ico
Terminal=false
Type=Application
Categories=Graphics;Utility;
EOF

# Construire le paquet .deb
dpkg-deb --build ${PACKAGE_NAME}_${VERSION}

# Nettoyer
rm -rf ${PACKAGE_NAME}_${VERSION}

echo "Paquet .deb créé avec succès : ${PACKAGE_NAME}_${VERSION}.deb"

