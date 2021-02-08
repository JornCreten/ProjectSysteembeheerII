# Testplan taak 1: Lokale testomgeving

* Installeer Vagrant: https://www.vagrantup.com/downloads.html
* Ga naar de folder **opdracht02/testomgeving**
* Klik op de balk waar het pad van de folder wordt weergegeven, en typ:\
        - `cmd`
* Voer het volgende commando uit in de cmd:\
        - `vagrant up`
* Dit programma zal dan het bash script in de folder provisioning met de naam van de host uitvoeren (in dit geval srv001)
* Indien dit geen errors geeft zou alles goed moeten zijn
* je kan inloggen op de vm via ssh met het commando: 
        `vagrant ssh`, passwoord "vagrant"
* Services **mariadb** en **httpd** moeten runnen, je kan controleren of al de verschillende services runnen met het commando's:\
        - `systemctl status mariadb`\
        - `systemctl status httpd`
* controleren of php geïnstalleerd is: 
         `php -v`
* Controleer of de webpagina beschikbaar is:\
        - `ifconfig` commando\
        - zoek naar het inet adress: `192.168.56.31`\
        - ga naar je internet browser en geef dat ip in de balk, je zou de **Testpage for the HTTP Server on Fedora** moeten krijgen\
* Controleer of de database aangemaakt is:
	- `mysqlshow -u root -p`
	- defaultwachtwoord is `pass`
	- Indien demodb hierbij staat is dit gebeurd
* Controleer of drupal online is
	- Browse naar `http://192.168.56.31/drupal`	
* Als dit allemaal werkt zonder een error, dan is de test goed verlopen        

Auteur(s) testplan: Jorn Creten, Dario Van Heck

# Testplan taak 2: Monitoring
Voor deze test is niet veel nodig: enkel een browser
* Browse naar https://ip-adres:9090, en log in met een user. een beschikbare user hiervoor is vagrant, met paswoord vagrant.
* Indien je de cockpit te zien krijgt, werkt dit.

## Load tests:
* Installeer httperf: `sudo dnf install httperf -y`
* Log in op cockpit (zie deel 1 testplan 2) en ga naar usage graphs
* `httperf --server=192.168.56.31` --port=80 --uri=/ --rate=0.2 --num-conns=100` 

# Productie-omgeving
* Ga naar de AWS console
* Maak een nieuwe vm aan. De grootte maakt niet veel uit, kan zo klein zijn als je wilt
* Ga onmiddelijk naar ´Configure security group´ en voeg HTTP & HTTPS toe (via Add rule)
* `Review and Launch` 
* Er zal gevraagd worden om een key-pair aan te maken. Ik raad aan om deze in dezelfde map als je ssh-keys op te slaan, want dat is eigenlijk wat deze zijn
* Wacht tot de server aangemaakt is
* Open filezilla, ga naar 
	- file
	- site manager
	- `new site`
	- Protocol: SFTP
	- host: Het ipv4 adres v/d server
	- Logon type : Key file
	- user : ec2-user
	- Key file: Browse naar je key file 
	- `connect`
* Drop de scripts (srv002, common & util) in de homefolder v/d ec2-user
* Druk op connect en volg de instructies (vervang je adres naar de key in dit commando) om binnen te kunnen ssh-en in de server
* maak srv002 executable: `sudo chmod 666 srv002.sh`
* voer srv002 uit: sudo ./srv002.sh
* Services **mariadb** en **httpd** moeten runnen, je kan controleren of al de verschillende services runnen met het commando's:\
        - `systemctl status mariadb`\
        - `systemctl status httpd`
* controleren of php geïnstalleerd is: 
         `php -v`
* Controleer of de webpagina beschikbaar is:\
        - `ifconfig` commando\
        - zoek naar het inet adress: te vinden op de interface van AWS \
        - ga naar je internet browser en geef dat ip in de balk, je zou de **Testpage for the HTTP Server on RHEL** moeten krijgen\
* Controleer of de database aangemaakt is:
	- `mysqlshow -u root -p`
	- defaultwachtwoord is `pass`
	- Indien demodb hierbij staat is dit gebeurd
* Controleer of drupal online is
	- Browse naar `http://IPVANDESERVER/drupal`	
* Als dit allemaal werkt zonder een error, dan is de test goed verlopen   


# Containervisualisatie
* Installeer Vagrant: https://www.vagrantup.com/downloads.html
* Ga naar de folder **opdracht02/dockeromgeving**
* Klik op de balk waar het pad van de folder wordt weergegeven, en typ:\
        - `cmd`
* Voer het volgende commando uit in de cmd:\
        - `vagrant up`
* Dit programma zal dan het bash script in de folder provisioning met de naam van de host uitvoeren (in dit geval srv001)
* Indien dit geen errors geeft zou alles goed moeten zijn
* Je kan inloggen op de vm via ssh met het commando: 
        `vagrant ssh`, passwoord "vagrant"
* Controleer of al de containers aangemaakt zijn en runnen:
	- `sudo docker ps -a` 
	- Indien de machines httpd, mariadb & drupal allemaal runnen (laatste kolom) zou dit moeten werken
* Controleer of de webpagina beschikbaar is:\
        - `ifconfig` commando\
        - zoek naar het inet adress: `192.168.56.32`\
        - ga naar je internet browser en geeft dat ip in op poort 8090 in de balk, `192.168.56.32:8090` je zou de **Testpage for the HTTP Server on CentOS** moeten krijgen\
* Controleer of drupal online is
	- Browse naar `http://192.168.56.32:8080`
	- Indien je de drupal pagina te zien krijgt werkt dit

Auteur testplan: Jorn Creten


