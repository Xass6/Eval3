
echo "Quel IP souhaitez-vous ajouter à votre serveur?"
read ip

echo "Quel dossier dois-je vous créer pour l'affilier ?"
read dossier

mkdir $dossier
vagrant init

echo "# -*- mode: ruby -*-" >> ./Vagrantfile

echo "# vi: set ft=ruby :" >> ./Vagrantfile

echo "Vagrant.configure('2') do |config|" >> ./Vagrantfile

echo "config.vm.box = 'ubuntu/xenial64'" >> ./Vagrantfile

echo "config.vm.network 'private_network', ip: '$ip'" >> ./Vagrantfile

echo "config.vm.synced_folder './$dossier', '/var/www/html'" >> ./Vagrantfile

echo "end" >> ./Vagrantfile

echo "Voulez vous utiliser la VirtualBox (y/n)?"
read reponse

if [ $reponse = "y" ] ;
then
cd data
touch scritp.sh

echo "#!/bin/bash" >> ./scritp.sh

echo "rm index.html" >> ./scritp.sh

echo "echo \"Installation des paquets\"" >> ./scritp.sh

echo "mkdir paquets" >> ./scritp.sh

echo "cd paquets" >> ./scritp.sh

echo "sudo apt install apache2" >> ./scritp.sh

echo "touch index.html script.js style.css" >> ./scritp.sh

echo "echo \"Fini !\"" >> ./scritp.sh

echo "echo \"Voulez vous créer un utilisateurs y/n ?\"" >> ./scritp.sh

echo "read reponse" >> ./scritp.sh

echo "if [ \$reponse = \"y\" ] ;" >> ./scritp.sh

echo "then echo \"Quel nom, sans majuscule?\"" >> ./scritp.sh

echo "read nom" >> ./scritp.sh

echo "sudo adduser \$nom" >> ./scritp.sh

echo "else [ \$reponse = \"n\" ];" >> ./scritp.sh

echo "  echo \"Ok.\"" >> ./scritp.sh

echo "fi" >> ./scritp.sh

cd ../
vagrant up
vagrant ssh
else [ $reponse = "n" ];
  echo "Ok."
fi
