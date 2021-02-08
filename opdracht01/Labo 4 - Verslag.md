# Labo 4 - Verslag

## Werkwijze Opdracht

* **Stap 1:** Aanmaken topologie van de opdracht
* **Stap 2:** Ga naar R1, R2 en R3 en reset hun startup config
    - `erase startup-config`
    - `reload`
* **Stap 3:** Basis configuratie instellen op R1
    - `hostname R1`
    - `no ip domain-lookup`
    - `enable secret class`
    - `line con 0`
    - `password cisco`
    - `login`
    - `logging synchronous`
    - `exec-timeout 0 0`
    - `line vty 0 4`
    - `logging synchronous`
    - `exec-timeout 0 0`
    - `exit`
    - `exit`
* **Stap 4:** Debug ip routing aanzetten
    - `debug ip routing`
* **Stap 5:** configureer interface op de router
    - `int g0/0/0`
    - `ip address 172.16.3.1 255.255.255.0`
    - `no shut`
    - `int s0/1/0`
    - `ip address 172.16.2.1 255.255.255.0`
    - `no shut`
    - `clock rate 64000`
* **Stap 6:** Herhaal **Stap 3** voor R2 en R3 met de juiste adressen en poorten
* **Stap 7:** Debugging afzetten op routers
    - `no debug ip routing`
* **Stap 8:** Configureer de juiste ip adressen, subnet masks en default gateways op PC1, PC2 en PC3
* **Stap 9:** Test connectiviteit naar default gateway per pc
    - `ping [gateway adres]`
* **Stap 10:** Test connectiviteit tussen de routers
    - `ping [router adres]`
* **Stap 11:** Test connectiviteit tussen pc's (deze zouden niet kunnen pingen)
* **Stap 12:** Configureer statische routes met next-hop adres voor R3 via next-hop van R2
    - `ip route 172.16.1.0 255.255.255.0 192.168.1.2`
* **Stap 13:** Kijk na of ze in de ip routing table staat
    - `exit`
    - `show ip route`
* **Stap 14:** Ping van PC3 naar PC2 (dit werkt niet)
* **Stap 15:** Configureer statische route op R2
    - `ip route 192.168.2.0 255.255.255.0 192.168.1.1`
    - `exit`
    - `show ip route`
* **Stap 16:** Ping van PC3 naar PC2 (dit werkt nu **wel**)
* **Stap 17:** Configureer statische route via exit interface op R3
    - `ip route 172.16.2.0 255.255.255.0 serial0/1/0` (kijken naar juiste serial poort)
* **Stap 18:** Ping van PC2 naar PC1 (dit werkt)
* **Stap 19:** Ping van PC3 naar PC1 (dit werkt niet)
* **Stap 20:** Configureer statische route van R3 naar R1
* **Stap 21:** Ping van PC3 naar PC1 (dit zou nu moeten werken)
* **Stap 22:** verwijder configs op de routers
    - `erase startup-config`

