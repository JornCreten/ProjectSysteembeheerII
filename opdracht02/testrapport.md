# Testrapport taak 1:

## Test 1

**Uitvoerder(s) test:** Dario Van Heck | **Uitgevoerd op:** 22/03/2020 | **Github commit:**  COMMIT HASH\

* Na het uitvoeren van het `vagrant up` commando worden eerst de nodige files geïnstalleerd, daarna wordt een script uitgevoerd.
* Deze uitvoering gaf geen enkele fout.
* Na het uitvoeren van het `vagrant ssh` commando, worden volgende commando's uitgevoerd:
    - `systemctl status mariadb` geeft weer dat deze service active is, dit is dus goed
    - `systemctl status httpd` geeft ook weer dat deze service active is, dit is dus ook goed
* Het commando `php -v` geeft de huidig geïnstalleerde versie van php weer 
* De webpagina **Fedora Webserver Test Page** wordt weergegeven na het ingeven van het ip adres `192.168.56.31`
* Database is aangemaakt
* drupal8 webpagina laad

Alle tests zijn goed verlopen en gaven geen errors

## Test 2
**Uitvoerder(s) test:** Dario Van Heck | **Uitgevoerd op:** 22/03/2020 | **Github commit:**  COMMIT HASH\

* Het surfen naar de webpagina gaat
* Inloggen met vagrant vagrant werkt
* Installatie slaagt
* Graphs aflezen werkt

## Test 3
**Uitvoerder(s) test:** Dario Van Heck | **Uitgevoerd op:** 22/03/2020 | **Github commit:**  COMMIT HASH\

* httpd, mariadb en drupal runnen allemaal
* De webpagina die te zien is zegt "A Default webpage!"
* De drupal pagina is te zien


