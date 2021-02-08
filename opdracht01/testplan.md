# Testplan taak 1: Testen van Labo's 1-4

Auteur(s) testplan: Dario Van Heck

## Labo 1: Test

Open de file **Labo1.pka**.\
Ga naar de **Desktop** tab, en daarna naar de **Command Line** van **Student-1** en geef volgend commando in:
  - `ping 10.10.10.5`
  
Er zou geen request timeout mogen zijn, en er zouden replies moeten gegeven worden.\
Ga nu naar de **Desktop** tab, en daarna naar de **Command Line** van **Student-2** en geef volgend commando in:
  - `ping 10.10.10.4`

Dit zou ook geen request timeout mogen geven en wel replies geven.

## Labo 2: Test

Open de file **labo2.pkt** en wacht tot alle lampjes op de kabels groen zijn.\
Ga naar de **Desktop** tab, en daarna naar de **Command Line** van **PC-A** en geef volgend commando in:
  - `ping 192.168.1.10`
  
Er zou geen request timeout mogen zijn, en er zouden reply's moeten gegeven worden.
Ga nu naar de **Desktop** tab, en daarna naar de **Command Line** van **PC-B** en geef volgend commando in:
  - `ping 192.168.1.11`

Dit zou ook geen request timeout mogen geven en wel replies geven.

## Labo 3: Test

Open de file **labo3.pkt** en wacht tot alle lampjes op de kabels groen zijn.\
Ga naar de **Desktop** tab, en daarna naar de **Command Line** van **PC-A** en geef volgend commando in:
  - `ping 192.168.0.3`

Bij dit commando kan de eerste reply mogelijk een timeout zijn (dit is normaal), hierna zou er altijd\
een reply moeten zijn zonder timeout.\
\
Ga naar de **Desktop** tab, en daarna naar de **Command Line** van **PC-B** en geef volgend commando in:
  - `ping 192.168.1.3`

Hierbij zou je geen timeouts mogen krijgen en replies krijgen. Wanneer dit zo is, zijn de tests\
goed verlopen.

## Labo 4: Test

Open de file **labo4.pkt** en wacht tot alle lampjes op de bals groen zijn.\
Ga naar de **Desktop** tab, en daarna naar de **Command Line** van **PC1** en geef volgend commando's in:
  - `ping 172.16.1.10`
  - `ping 192.168.2.10`
  
Beide commando's zouden replies moeten geven.\
Ga nu naar de **Desktop** tab, en daarna naar de **Command Line** van **PC2** en geef volgend commando's in:
  - `ping 172.16.3.10`
  - `ping 192.168.2.10`
  
Hier zouden ook beide commando's replies moeten geven.\
Ga naar de **Desktop** tab, en daarna naar de **Command Line** van **PC3** en geef volgend commando's in:
  - `ping 172.16.3.10`
  - `ping 172.16.1.10`
  
Als ook hier de commando's repleis geven, zou alles goed moeten zijn en zijn de tests goed verlopen.

