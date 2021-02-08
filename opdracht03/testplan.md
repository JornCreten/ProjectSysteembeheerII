# Testplan taak 3: Opstelling Packet Tracer

Auteur(s) testplan: Dario Van Heck

Voor deze test moet er gepinged worden tussen alle computers en de server

* Ga naar **Laptop0** en geef volgende commando's in:
    - `ping 192.168.0.101` deze ping is naar **Laptop1** en zou moeten slagen
    - `ping 192.168.0.104` deze ping is naar **Laptop2** en zou moeten slagen
    - `ping 192.168.0.105` deze ping is naar **Server0** en zou moeten slagen
  
 * Ga naar **Laptop1** en geef volgende commando's in:
    - `ping 192.168.0.103` deze ping is naar **Laptop0** en zou moeten slagen
    - `ping 192.168.0.104` deze ping is naar **Laptop2** en zou moeten slagen
    - `ping 192.168.0.105` deze ping is naar **Server0** en zou moeten slagen
   
 * Ga naar **Laptop2** en geef volgende commando's in:
    - `ping 192.168.0.103` deze ping is naar **Laptop0** en zou moeten slagen
    - `ping 192.168.0.101` deze ping is naar **Laptop1** en zou moeten slagen
    - `ping 192.168.0.105` deze ping is naar **Server0** en zou moeten slagen
    
  * Ga naar **Server0** en geef volgende commando's in:
    - `ping 192.168.0.103` deze ping is naar **Laptop0** en zou moeten slagen
    - `ping 192.168.0.101` deze ping is naar **Laptop1** en zou moeten slagen
    - `ping 192.168.0.104` deze ping is naar **Laptop2** en zou moeten slagen

