from PyInstaller.utils.hooks import collect_data_files, collect_submodules

# Collecter les données et sous-modules nécessaires
datas = collect_data_files('PIL')
hiddenimports = collect_submodules('PIL')
