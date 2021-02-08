# Cheatsheet voor vagrant, linux en docker

## Vagrant:
* vagrant up: start de machine / maakt de machine aan en runt provisioning
* vagrant ssh: ssh't in de machine. Indien er meerdere machines zijn binnen de vagrantfile dan moet je specifiëren welke machine (bij naam) je witl
* vagrant suspend: save machine state in virtualbox
* vagrant halt: issuet eerst het shutdown commando binnen linux, indien dit niet werkt sluit hij de stroom af
* vagrant status: geeft simpelweg de status

## Linux:
* systemctl status service: waar service de app is waarvan je info wil
* systemctl start,enable,restart,reload service: naam zegt het zelf, enable zorgt ervoor dat de service bij startup v/h machine opgestart wordt
* ifconfig: ipconfig maar voor linux

## Docker
* sudo docker ps -a: toont alle containers
* sudo docker network create netwerknaam : maakt een netwerk aan voor communicatie tussen verschillende containers
* sudo docker run --name naam --network netwerk -p buitenpoort:binnenpoort imagenaam : naam = naam v/d container, netwerk = het netwerk, buitenpoort en binnenpoort is voor internetverkeer te regelen, imagenaam is de naam van de image die je wilt gebruiken (controleer de repository hub op docker)
* sudo docker stop naam
* sudo docker rm naam
