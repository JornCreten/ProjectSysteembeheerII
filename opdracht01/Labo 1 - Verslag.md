# Labo 1 - Verslag

## Werkwijze opdracht

* **Stap 1:** console kabel aanleggen van PC1 op poort RS 232 naar switch "Class-1" op de console poort.
* **Stap 2:** IP Configuration openen op PC1 en het juiste IP address & subnet mask instellen.
* **Stap 3:** IP Configuration openen op PC2 en het juiste IP address & subnet mask instellen.
* **Stap 4:** Terminal openen op PC1.
* **Stap 5:** Switch enablen.
    - `en` commando
* **Stap 6:** Naar configuratie mode van switch gaan.
    - `conf t` commando
* **Stap 7:** Naam van de switch aanpassen.
    - `hostname Class-A` commando
* **Stap 8:** wachtwoorden zetten op alle lijnen.
    - `lin con 0` commando
    - `password R4Xe3` commando
    - `login` commando
    - `lin vty 0 15` commando
    - `password R4Xe3` commando
    - `login local` commando
* **Stap 9:** secret wachtwoord geven
    - `enable secret C4aJa` commando
* **Stap 10:** Alle clear text wachtwoorden encrypteren.
    - `service password-encryption` commando
* **Stap 11:** Warning toevoegen aan banner message
    - `banner motd Warning, unauthorized access` commando
* **Stap 12:** Interface configureren
    - `int vlan 1` commando
    - `ip add 10.10.10.100 255.255.255.0` commando
    - `no shutdown` commando
* **Stap 13:** Configuratie opslaan
    - `do copy run start` commando
* **Stap 14:** herhaal de stappen vanaf **Stap 4** voor PC2

## Factory Reset van router/switch

* **Stap 1:** Herstart de router of switch (trek kabel uit pc en steek opnieuw in)
* **Stap 2:** Terwijl de router of switch aan het herstarten is, gebruik toetsencombinatie **CTRL+C**
* **Stap 3:** Geef volgende code in
    - `CONFREG 0X2142`
    - `reset`
De router/switch zal nu opnieuw opstarten, nadat deze herstart is doe je:
* **Stap 4:** De configuratie mode ingaan en de router/switch resetten
    - `en`
    - `erase startup-config`
    - druk hierna op de `ENTER` toets
    - `reload`
Hierna zal het apparaat opnieuw opstarten en is het volledig gereset
