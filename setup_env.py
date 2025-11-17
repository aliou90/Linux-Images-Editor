import subprocess
import sys

# Nom de l'environnement virtuel
env_name = "myenv"

# Création de l'environnement virtuel
subprocess.run([sys.executable, "-m", "venv", env_name])

# Activation de l'environnement virtuel
if sys.platform == "win32":
    activate_script = f"{env_name}\\Scripts\\activate"
else:
    activate_script = f"source {env_name}/bin/activate"

# Commande pour installer les modules nécessaires
install_command = f"{env_name}/bin/pip install "

modules = [
    "numpy",
    "tempfile",
    "json",
    "datetime",
    "opencv-python-headless",
    "requests",
    "glob2",
    "rembg",
    "Pillow",
    "customtkinter",
    "tk",
    "pathlib",
    "opencv-python",
    "requests"
]

# Construire la commande d'installation des modules
install_command += " ".join(modules)

# Exécuter la commande d'installation des modules
subprocess.run(install_command, shell=True)

print(f"Environnement virtuel '{env_name}' créé et modules installés.")
print(f"Pour activer l'environnement virtuel, exécutez: {activate_script}")
