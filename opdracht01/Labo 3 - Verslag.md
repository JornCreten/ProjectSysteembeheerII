# Labo 3 - Verslag

## Werkwijze Opdracht

* **Stap 1:** 2 computers (PC-A en PC-B), 1 switch (S1) en 1 router (R1) aanmaken
* **Stap 2:** Koper kabels aanleggen
    - van `PC-A` naar `S1`
    - van `S1` naar `R1`
    - van `R1` naar `PC-B`
* **Stap 3:** IP Configuration openen op PC-A en het juiste IP adres, subnet mast & default gateway instellen
* **Stap 4:** IP Configuration openen op PC-B en het juiste IP adres, subnet mast & default gateway instellen
* **Stap 5:** Pingen van PC-B naar PC-A
* **Stap 6:** Naar priveleged EXEC mode van R1 gaan
    - `en` commando
* **Stap 7:** Naar configuration mode gaan
    - `conf t` commando
* **Stap 8:** Router de naam R1 geven
    - `hostname R1` commando
* **Stap 9:** DNS lookup uitzetten 
    - `no ip domain-lookup` commando
* **Stap 10:** Priveleged EXEC mode het wachtwoord class geven
    - `enable secret class` commando
* **Stap 11:** Console wachtwoord cisco instellen en login enablen
    - `line con 0` commando
    - `password cisco` commando
    - `login` commando
    - `exit` commando
* **Stap 12:** Vty het wachtwoord cisco geven en login enablen
    - `line vty 0 4` commando
    - `password cisco` commando
    - `login` commando
    - `exit` commando
* **Stap 13:** Wachtwoorden encrypteren
    - `service password-encryption` commando
* **Stap 14:** Banner message instellen
    - `banner motd #` commando
    - `Unauthorized access prohibited!` commando
    - `#` commando
* **Stap 15:** Interfaces configureren
    - `int g0/0/0` commando
    - `description Connection to PC-B` commando
    - `ip address 192.168.0.1 255.255.255.0` commando
    - `no shut` commando
    
    - `int g0/0/1` commando
    - `description Connection to S1` commando
    - `ip address 192.168.1.1 255.255.255.0` commando
    - `no shut` commando
    - `exit` commando
    - `exit` commando
* **Stap 16:** Running configuration opslaan
    - `copy run start` commando
* **Stap 17:** Clock op de router zetten
    - `clock set 8:33:15 25 Feb 2020` commando
* **Stap 18:** Ping van PC-B naar PC-A

## Appendix - Reloading Router & Switch

* **Stap 1:** Ga naar priveleged EXEC van R1
    - `en` commando
* **Stap 2:** Startup configuratie verwijderen
    - `erase startup-config` commando
* **Stap 3:** Router reloaden
    - `reload` commando
\    
* **Stap 4:** Ga naar de priveleged EXEC van S1
    - `en` commando
* **Stap 5:** toon de flash
    - `show flash` commando
* **Stap 6:** Verwijder eventuele VLAN file
    - `delete vlan.dat` commando
* **Stap 7:** Verwijder startup configuration
    - `erase startup-configuration` commando
    
## Fysieke Demo - Stappen

* **Stap 1:** Alle stappen van hiervoor overlopen
* **Stap 2:** Public Firewall afzetten op alle computers
    

