# OpenModelica_Furuta - still under construction
Modell eines Furuta-Pendels in OpenModelica für Anwendungen in der Lehre

Inhalt

#1 OpenModelica-Paket (Furuta_V09.mo), bestehend aus:
- mechanisches Teilmodell des Pendels (OpenModelica/Multibody)
- Teilmodell Aktuator-(Unter-)Modell mit drei Abstraktionsstufen:
   - ideal
   - mit dynamischem Antwortverhalten
   - erweitert
     (Hinweis: keine detaillierte elektrodynamische Modellierung)
- Gesamtsystem einschließlich einer (einfachen) Regelung im geschlossenen Regelkreis
- Test des Aktuators als offenes System mit Schwungmasse
- Gesamtsystem mit aufgeprägter stochastischer Störgröße (Noise)
- Gesamtsystem mit Handling unkontrollierter Schwingung (Abbruch Lagerregelung oben, Abbremsen des Systems durch Lageregelung unten)

#2 FMU des mechanischen Teilmodells
(Pendel_Mechanik_fin_04.fmu)

#3 FMU des dreistufigen Aktuatormodells
(Akt_gestuft_fin_03.fmu)

#4 OpenModelica-Paket zum Schritt-für-Schritt Aufbau des Modells
(Furuta_Steps.mo)

#5 Python-Skript zur Visualisierung der Drehmoment-Sprungantwort des Aktuatormodells
(Charac_Akt_V06.py)

#6 Python-Skripte zur Erzeugung von Auswerte-Charts auf Basis von CSV-Ergebnisdateien aus OpenModelica
(Charts_Python_Skript.zip)
erforderliche Bibliotheken installieren: "pip install fmpy matplotlib pandas numpy"

Hinweis: Konstruktive Ausführung und Abmessungen des Pendels orientieren sich am folgenden Furuta-Pendel bzw. Modell einschließlich CAD-Daten:
www.github.com/bgkatz/Furuta-Pendulum



Copyright (c) 2026 DrMWK

Hiermit wird jeder Person, die eine Kopie dieser Software und der zugehörigen Dokumentationsdateien (die „Software“) erhält, unentgeltlich die Erlaubnis erteilt, die Software uneingeschränkt zu nutzen. Dies umfasst insbesondere das Recht, die Software zu verwenden, zu kopieren, zu verändern, zusammenzuführen, zu veröffentlichen, zu verbreiten, zu unterlizenzieren und/oder zu verkaufen sowie Personen, denen die Software zur Verfügung gestellt wird, diese Rechte einzuräumen, sofern die folgenden Bedingungen erfüllt werden:

Der oben genannte Copyright-Hinweis sowie dieser Genehmigungstext müssen in allen Kopien oder wesentlichen Teilen der Software enthalten sein.

DIE SOFTWARE WIRD „WIE BESEHEN“ BEREITGESTELLT, OHNE JEGLICHE AUSDRÜCKLICHE ODER STILLSCHWEIGENDE GEWÄHRLEISTUNG. DIES SCHLIESST UNTER ANDEREM DIE GEWÄHRLEISTUNGEN DER MARKTGÄNGIGKEIT, DER EIGNUNG FÜR EINEN BESTIMMTEN ZWECK UND DER NICHTVERLETZUNG VON RECHTEN DRITTER AUS. IN KEINEM FALL HAFTEN DIE AUTOREN ODER COPYRIGHT-INHABER FÜR ANSPRÜCHE, SCHÄDEN ODER SONSTIGE VERPFLICHTUNGEN, SEI ES AUS VERTRAG, UNERLAUBTER HANDLUNG ODER ANDERWEITIG, DIE SICH AUS DER SOFTWARE ODER IHRER NUTZUNG ODER AUS SONSTIGEN VORGÄNGEN IM ZUSAMMENHANG MIT DER SOFTWARE ERGEBEN.

