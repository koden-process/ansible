sudo apt install gnome-terminal

echo "Téléchargement de Docker Desktop à effectuer manuellement sur le site officiel de Docker https://docs.docker.com/desktop/install/ubuntu/"

sudo apt-get update
sudo apt-get install ./docker-desktop-<version>-<arch>.deb

systemctl --user enable docker-desktop

echo "Docker Desktop est installé"
echo "Pour lancer Docker Desktop sur Ubutu 24.04 il faut exécuter la commande suivante :"
echo "sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0"