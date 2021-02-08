#cheat sheet

* **Naar Privileged EXEC mode gaan:** `en`
* **Configure terminal:** `conf t`
* **Naam geven aan het apparaat:** `hostnaam _naam_`
* **Lijnen configuratie:** `line _con/vty/..._`
* **Wachtwoord instellen voor een lijn:** `Password _wachtwoord_`
* **Wachtwoord geven:** `enable secret _wachtwoord_`
* **Commando's encrypteren:** `service password-encryption`
* **De message of the day instellen:** `banenr motd _bericht_`
* **Interface config openen:** `int _interface + nummer_`
* **Clockrate instellen op een interface:** `clock rate _getal_`
* **Beschrijving geven aan een interface:** `descripion _tekst_`
* **Ip instellen:** `ip add _ip + subnetmask_`
* **Aanzetten van een interface:** `no shutdown`
* **1 stap terug gaan:** `exit`
* **Terug naar Privileged EXEC mode:** `end`
* **Configuratie opslaan:** `copy run start`
* **Ongewenste dns lookups voorkomen:** `no ip domain-lookup`
* **Huidige configuratie tonen:** `show running-config`
* **Status van de interfaces op de switch weergeven:** `show ip interface brief`
* **IOS versie weergeven:** `show version`
* **Clock instellen op router:** `clock set _uren:minuten:seconden dag maand jaar_`
* **Debugging afzetten op routers:** `no debug ip routing`
* **Voorkomt dat IOS berichten naar je console of telnet worden gestuurd:** `logging synchonous`
