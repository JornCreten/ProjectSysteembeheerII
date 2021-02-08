# Testrapport taak 1: Packet Tracer Labos

## Test Labo 1

**Uitvoerder(s) test:** Thomas Hugo | 
**Uitgevoerd op:** 20/02/2020 | 
**Github commit:**  COMMIT HASH 

* **Ping van Student-1 naar Student-2:** deze ping geeft geen timeouts en geeft replies
* **Ping van Student-2 naar Student-1:** deze ping geeft geen timeouts en geeft replies

## Test Labo 2
**Uitvoerder(s) test:** Jorn Creten | 
**Uitgevoerd op:** 25/02/2020 | 
**Github commit:**  COMMIT HASH 

* **Ping van PC-A (192.168.1.10) naar PC-B** (192.168.1.11) geeft geen timeouts en geeft replies zonder packet loss
* **Ping van PC-B (192.168.1.11) naar PC-A** (192.168.1.10) geeft geen timeouts en geeft replies zonder packet loss


## Test Labo 3
**Uitvoerder(s) test:** Jorn Creten | 
**Uitgevoerd op:** 25/02/2020 | 
**Github commit:**  COMMIT HASH 

* **Ping van PC-A (192.168.1.03) naar PC-B** (192.168.0.03) geeft enkel een timeout op de eerste reply en de andere replies werken
* **Ping van PC-B (192.168.0.03) naar PC-A** (192.168.1.03) geeft geen timeouts en geeft replies zonder packet loss

## Test Labo 4
**Uitvoerder(s) test:** Jorn Creten | 
**Uitgevoerd op:** 25/02/2020 | 
**Github commit:**  COMMIT HASH 

* **Ping van PC1 (172.16.3.10) naar PC2** (172.16.1.10) geeft enkel een timeout op de eerste reply en de andere replies werken
* **Ping van PC1 (172.16.3.10) naar PC3** (192.168.2.10) geeft enkel een timeout op de eerste reply en de andere replies werken

* **Ping van PC2 (172.16.1.10) naar PC1** (172.16.3.10) geeft geen timeouts en geeft replies zonder packet loss
* **Ping van PC2 (172.16.1.10) naar PC3** (192.168.2.10) geeft geen timeouts en geeft replies zonder packet loss

* **Ping van PC3 (192.168.2.10) naar PC1** (172.16.3.10) geeft geen timeouts en geeft replies zonder packet loss
* **Ping van PC3 (192.168.2.10) naar PC2** (172.16.1.10) geeft geen timeouts en geeft replies zonder packet loss
