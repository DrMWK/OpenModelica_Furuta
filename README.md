# OpenModelica_Furuta - still under construction
Modell eines Furuta-Pendels in OpenModelica für Anwendungen in der Lehre

Inhalt

#1 OpenModelica-Paket (Furuta_V07.mo), bestehend aus:
- mechanisches Teilmodell des Pendels (OpenModelica/Multibody)
- Teilmodell Aktuator-(Unter-)Modell mit drei Abstraktionsstufen:
   - ideal
   - mit dynamischem Antwortverhalten
   - erweitert
     (Hinweis: keine detaillierte elektrodynamische Modellierung)
- Gesamtsystem einschließlich einer (einfachen) Regelung im geschlossenen Regelkreis

#2 FMU des mechanischen Teilmodells
(Pendel_Mechanik_fin_04.fmu)

#3 FMU des dreistufigen Aktuatormodells
(Akt_gestuft_fin_03.fmu)

#4 OpenModelica-Paket zum Schritt-für-Schritt Aufbau des Modells
(Furuta_Steps.mo)

#5 Python-Skript zur Visualisierung der Drehmoment-Sprungantwort des Aktuatormodells
(Charac_Akt_V06.py)

Hinweis: Konstruktive Ausführung und Abmessungen des Pendels orientieren sich am folgenden Furuta-Pendel bzw. Modell einschließlich CAD-Daten:
www.github.com/bgkatz/Furuta-Pendulum



Copyright (c) 2026 DrMWK

Hiermit wird jeder Person, die eine Kopie dieser Software und der zugehörigen Dokumentationsdateien (die „Software“) erhält, unentgeltlich die Erlaubnis erteilt, die Software uneingeschränkt zu nutzen. Dies umfasst insbesondere das Recht, die Software zu verwenden, zu kopieren, zu verändern, zusammenzuführen, zu veröffentlichen, zu verbreiten, zu unterlizenzieren und/oder zu verkaufen sowie Personen, denen die Software zur Verfügung gestellt wird, diese Rechte einzuräumen, sofern die folgenden Bedingungen erfüllt werden:

Der oben genannte Copyright-Hinweis sowie dieser Genehmigungstext müssen in allen Kopien oder wesentlichen Teilen der Software enthalten sein.

DIE SOFTWARE WIRD „WIE BESEHEN“ BEREITGESTELLT, OHNE JEGLICHE AUSDRÜCKLICHE ODER STILLSCHWEIGENDE GEWÄHRLEISTUNG. DIES SCHLIESST UNTER ANDEREM DIE GEWÄHRLEISTUNGEN DER MARKTGÄNGIGKEIT, DER EIGNUNG FÜR EINEN BESTIMMTEN ZWECK UND DER NICHTVERLETZUNG VON RECHTEN DRITTER AUS. IN KEINEM FALL HAFTEN DIE AUTOREN ODER COPYRIGHT-INHABER FÜR ANSPRÜCHE, SCHÄDEN ODER SONSTIGE VERPFLICHTUNGEN, SEI ES AUS VERTRAG, UNERLAUBTER HANDLUNG ODER ANDERWEITIG, DIE SICH AUS DER SOFTWARE ODER IHRER NUTZUNG ODER AUS SONSTIGEN VORGÄNGEN IM ZUSAMMENHANG MIT DER SOFTWARE ERGEBEN.


============================================================================================


Model of a Furuta Pendelum in OpenModelica for potential didactic use 

Content

#1 OpenModelica Package (Furuta_V07.mo) including
- mechanic (sub)model of the pendelum (OpenModelica/Multibody)
- actuator (sub)model with 3 degrees of abstraction (ideal/including dynamic response/enhanced; no detailed electro-dynamic modeling)
- entire system including a (simple) closed loop control

#2 FMU of the mechanic model (Pendel_Mechanik_fin_04.fmu)

#3 FMU of the 3 level actuator model (Akt_gestuft_fin_03.fmu)

#4 OpenModelica Package for step-by-step build-up of the model (Furuta_Steps.mo)

#5 Python Script for visualizing the torque step response of the actuator model (Charac_Akt_V06.py)


Remark: design and dimensions of the pendelum are oriented on the following Furuta pendelum / model including CAD data:
www.github.com/bgkatz/Furuta-Pendulum



Copyright (c) 2026 DrMWK

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
