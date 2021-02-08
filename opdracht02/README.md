# Gebruikersdocumentatie opzetten van LAMP-stack 

## Voor lokale omgeving
* Voer het commando `Vagrant up` uit in de folder waar de scripts zich bevinden
* Indien u via drupal wil werken, kan u nu simpelweg via http://jouwipadres/drupal naar de webapplicatie gaan. Alle namen & wachtwoorden zijn in te stellen via het configuratiedocument common.sh
	* Anders kan u via een ftp client zoals filezilla verbinden met de server: 
		- Hostname = uw ip adres
		- user = de user die u zelf hebt ingesteld in common
		- paswoord = idem ^
		- port = 22
	* en navigeer met de GUI naar var/www/html
	* hier kan u uw webpagina plaatsen
## Voor een server in de cloud
* Maak een virtuele machine aan op AWS & selecteer RHEL 8
* Zorg ervoor dat poorten `22, 80 en 443` ZEKER openstaan (onder security groups)
* Selecteer je machine, en druk op connect. Volg de stappen.
* Verbind met de server via filezilla en drop de scripts `srv002.sh, common.sh & util.sh` onder je user
* Verbind nu met de server via een ssh-client of command line en voer de volgende commando's uit:
	- `sudo chmod 750 srv002.sh`
	- `sudo ./srv002.sh`
* Indien u via drupal wil werken, kan u nu simpelweg via http://jouwipadres/drupal naar de webapplicatie gaan. Alle namen & wachtwoorden zijn in te stellen via het configuratiedocument common.sh
	* Anders kan u via een ftp client zoals filezilla verbinden met de server zoals eerder gedaan voor de scripts
	* en navigeer met de GUI naar var/www/html
	* hier kan u uw webpagina plaatsen
## Docker
* Voer het commando `Vagrant up` uit in de folder waar de scripts zich bevinden
* Indien u via drupal wil werken, kan u nu simpelweg via http://jouwipadres:8080 naar de webapplicatie gaan. 
* Alle namen & wachtwoorden zijn in te stellen via het configuratiedocument common.sh
* Bij de database moet u poort 3306 specifiëren
	* Anders kan u via een ftp client zoals filezilla verbinden met de server: 
		- Hostname = uw ip adres
		- user = de user die u zelf hebt ingesteld in common
		- paswoord = idem ^
		- port = 22
	* en navigeer met de GUI naar /home/user/website/
	* hier kan u uw webpagina plaatsen


Auteur gebruikersdocumentatie: Jorn Creten


