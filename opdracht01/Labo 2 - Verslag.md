# Labo 2 - Verslag

## Werkwijze opdracht

* **Stap 1:** 2 computers (PC-A en PC-B) en 2 switches (S1 en S2) aanmaken
* **Stap 2:** Koper kabels aanleggen
    - van `PC-A` naar `S1`
    - van `S1` naar `S2`
    - van `S2` naar `PC-B`
* **Stap 3:** IP Configuration openen op PC-A en het juiste IP adres & subnet mask instellen
* **Stap 4:** IP Configuration openen op PC-B en het juiste IP adres & subnet mask instellen
* **Stap 5:** Open **Command Prompt** op PC-A en geef `ipconfig /all`commando in om instelling te controleren
* **Stap 6:** Open **Command Prompt** op PC-B en geef `ipconfig /all`commando in om instelling te controleren
* **Stap 7:** Console kabel aanleggen van PC-A naar S1
* **Stap 8:** Switch enablen.
    - `en` commando
* **Stap 9:** Naar configuratie mode van switch gaan.
    - `conf t` commando
* **Stap 10:** Naam van de switch aanpassen.
    - `hostname S1` commando
* **Stap 11:** Ongewenste DNS lookups voorkomen.
    - `no ip domain-lookup` commando
* **Stap 12:** lokaal wachtwoord instellen.
    - `enable secret class` commando
    - `lin con 0` commando
    - `password cisco` commando
    - `login` commando
    - `exit` commando
* **Stap 13:** Een login MOTD banner message instellen
    - `banner motd # Unauthorized access is strictly prohibited and prosecuted to the full extent of the law. #` commando
    - `exit` commando
* **Stap 14:** configuratie opslaan
    - `copy run start` commando
* **Stap 15:** Huidige configuratie tonen
    - `show running-config` commando
* **Stap 16:** IOS versie weergeven
    - `show version` commando
* **Stap 17:** Status van interfaces op de switch weergeven
    - `shopw ip interface brief` commando
* **Stap 18:** herhaal de stappen vanaf **Stap 8** voor PC2
* **Stap 19:** Appendix A is niet van toepassing (geen vlan.dat)
