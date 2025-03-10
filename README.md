# **Sessió de laboratori de PDDL**

En aquesta sessió us haureu de familiaritzar amb les eines (planner **ENHSP**) i el llenguatge de planificació que utilitzarem (**PDDL**).

## **Entorn de Treball**

Com a *planner* farem servir [ENHSP: Expressive Numeric Heuristic Search Planner](https://sites.google.com/view/enhsp/).

Aquest és un planner molt complet i competitiu i que permet una instal·lació molt senzilla que que permet descarregar un `.jar` executable amb JAVA 17. 

# **Treball desde el vostre ordinador personal** #

Per tant si us el voleu instal·lar en el vostre ordinador, seguiu les instruccions de la web i baixeu-vos la versió **enhsp-20** que és la que tenim a l'aula.

Un cop el descarregat, obriu un terminal i el podeu invocar:
```console
java -jar enhsp-20.jar -o [DOMINI.pddl] -f [PROBLEMA.pddl]
```
(assumint que teniu el `.jar` i els fitxers `.pddl` al mateix directori de treball)



# **Treball des de l'aula** #
Per a treballar amb els ordinadors de l'aula cal que obriu un terminal `cmd` des de allà feu:
```console
C:\Windows\System32> cd ..

C:\Windows> cd ..

C:> cd temp

C:\temp> mkdir Sessio3IA

C:\temp> cd Sessio3IA

C:\temp\Sessio3IA> planning
Iniciant entorn ENHSP

...

```
Aquesta seqüència de comandes us permet crear un directori de treball `Sessio3IA` dins el directori temporal `C:\temp>` i al invocar la comanda `planning` es copia en aquest directori el fitxer que conté el planner `enhsp-20.jar`, i un fitxer `.bat` que permet invocar el planner més còmodament. Ara només cal que afegiu en aquest directori de treball els fitxers `.pddl` que necessiteu i podeu resoldre'ls o bé així:
```console
java -jar enhsp-20.jar -o [DOMINI.pddl] -f [PROBLEMA.pddl]
```
o bé usant el fitxer `.bat`:
```console
enhsp -o [DOMINI.pddl] -f [PROBLEMA.pddl]
```
(assumint que teniu el `.jar` i els fitxers `.pddl` al mateix directori de treball des de on invoqueu les comandes).

# **Opcions del planner** #
Si invoqueu:
```console
java -jar enhsp-20.jar 
```
us sortiran les opcions de com utilitzar el planner. Algunes són molt tècniques i fora de l'abast del curs. D'altres prendran sentit en acabar tota la teoria. Una que és particularment útil és `-planner opt-blind` que permet buscar solucions *òptimes* (per exemple en nombre d'accions o en altres mètriques que haguem pogut definir).
```console
java -jar enhsp-20.jar -o [DOMINI.pddl] -f [PROBLEMA.pddl] -planner opt-blind
```
Ens buscaria una solució òptima.

# **Editors** #
Podeu treballar amb qualsevol editor de text com ara `notepad++` o eines més sofisticades com `vscode` al qual li podeu afegir un plug-in per a PDDL.

## **Tasques a fer**

Primer de tot, **instal·leu el planner**

Llegiu-vos el [fitxer de referència de PDDL](/PDDL-Intro/pddl-reference-ca.md).

# *Hanoi* #
- Descarregueu-vos els fitxers de la versió 1 de hanoi, familiaritzeu-vos amb el domini i proveu les instàncies que hi ha.
- Descarregueu-vos els fitxers de la versió 2 de hanoi, familiaritzeu-vos amb el domini i proveu les instàncies que hi ha. Què ha canviat? Ha trigat més o menys a resoldre-les?
- Proveu de resoldre les instancies amb el domini `hanoi-buggy.pddl` que hi ha al directori de la versió 2. Surten les mateixes solucions? Proveu d'executar amb optimització `-planner opt-blind' i ara, surten les mateixes solucions? perquè? on hi ha l'error de `hanoi-buggy.pddl`

Llegiu-vos el [cas d'us del problema gripper](/PDDL-Intro/pddl-cas-dus.md)

# *Gripper* #
- Descarregueu-vos els fitxers del domini gripper i les seves instàncies, familiaritzeu-vos amb el domini i proveu les instàncies que hi ha.
- Feu una *versió 2* del domini utilitzant tipus, quantificadors i negacions (passeu-lo a ADL), similarment com fa la versió 2 de Hanoi. És millor aquesta 2a versió de gripper que la primera?



TODO: exercises to do at home
