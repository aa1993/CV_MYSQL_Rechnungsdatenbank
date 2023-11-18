# Rechnungsdatenbank
## Inhalt und Grund

Diese Repo beinhaltet eine SQL Datei mit Dummy-Daten, die in eine MYSql datenbank einfach importiert werden können. Diese Repo soll meine Kenntnisse in SQL und MYSQL demonstrieren. Außerdem werde ich diese Dummydatenbank in Zukunft für andere Projekte benutzten.

## ER-Diagramm

Das Schema der Datenbank richtet sich nach folgendem Er-Diagramm:

![ER-Diagramm](/assets/images/ER-Diagramm.jpg)

## Inhalt

Die Inhalte der Datenbank sind folgende:

### Kunde
'''
mysql> select * from Kunde;
+--------------+-----------+-------------+------------------------+------------+-------+-------+
| Kundennummer | Vorname   | Nachname    | Strasse                | Hausnummer | PLZ   | Ort   |
+--------------+-----------+-------------+------------------------+------------+-------+-------+
|            1 | Andreas   | Metzger     | Krementzstr.           |          5 | 50931 | Köln  |
|            2 | Sandra    | Schmidt     | Ludwigsburger Str.     |         21 | 50739 | Köln  |
|            3 | Christian | Ebersbacher | Thorwaldsenstr.        |         12 | 51103 | Köln  |
|            4 | Brigitte  | Theiss      | Zehntstr.              |          6 | 51065 | Köln  |
|            5 | Daniela   | Beich       | Sigwinstr.             |        158 | 51061 | Köln  |
|            6 | Stefan    | Hahn        | Wilhelm-Schreiber-Str. |         46 | 50827 | Köln  |
+--------------+-----------+-------------+------------------------+------------+-------+-------+
'''

### Produkt
'''
mysql> select * from Produkt;
+---------------+----------------+-------+
| Artikelnummer | Produktname    | Preis |
+---------------+----------------+-------+
|             1 | Mehl           |  2.39 |
|             2 | Milch          |  0.99 |
|             3 | Eier 10er      |  1.69 |
|             4 | Butter         |  2.15 |
|             5 | Zucker         |  1.39 |
|             6 | Salz           |   1.9 |
|             7 | Paprikapulver  |  1.99 |
|             8 | Pfeffer        |  2.49 |
|             9 | Sahne          |   1.2 |
|            10 | Tomaten        |  2.59 |
|            11 | Gurken         |  1.35 |
|            12 | Eisbergsalat   |  1.69 |
|            13 | Zwiebel        |  1.59 |
|            14 | Kartoffel      |   1.8 |
|            15 | Apfel          |  3.49 |
|            16 | Birnen         |  2.69 |
|            17 | Bananen        |  1.35 |
|            18 | Wasser         |  1.09 |
|            19 | Bleistift      |  0.79 |
|            20 | Radiergummi    |  1.03 |
|            21 | Kugelschreiber |  1.99 |
|            22 | Heft           |  0.26 |
+---------------+----------------+-------+
'''

### Rechnung
'''
mysql> select * from Produkt;
+---------------+----------------+-------+
| Artikelnummer | Produktname    | Preis |
+---------------+----------------+-------+
|             1 | Mehl           |  2.39 |
|             2 | Milch          |  0.99 |
|             3 | Eier 10er      |  1.69 |
|             4 | Butter         |  2.15 |
|             5 | Zucker         |  1.39 |
|             6 | Salz           |   1.9 |
|             7 | Paprikapulver  |  1.99 |
|             8 | Pfeffer        |  2.49 |
|             9 | Sahne          |   1.2 |
|            10 | Tomaten        |  2.59 |
|            11 | Gurken         |  1.35 |
|            12 | Eisbergsalat   |  1.69 |
|            13 | Zwiebel        |  1.59 |
|            14 | Kartoffel      |   1.8 |
|            15 | Apfel          |  3.49 |
|            16 | Birnen         |  2.69 |
|            17 | Bananen        |  1.35 |
|            18 | Wasser         |  1.09 |
|            19 | Bleistift      |  0.79 |
|            20 | Radiergummi    |  1.03 |
|            21 | Kugelschreiber |  1.99 |
|            22 | Heft           |  0.26 |
+---------------+----------------+-------+
'''

### kauft
'''
mysql> select * from kauft;
+--------------+-----------------+---------------+--------+
| Kundennummer | Rechnungsnummer | Artikelnummer | Anzahl |
+--------------+-----------------+---------------+--------+
|            1 |               1 |             1 |      2 |
|            1 |               1 |             2 |      4 |
|            1 |               1 |             3 |      1 |
|            1 |               1 |             4 |      3 |
|            1 |               1 |             5 |      1 |
|            1 |               1 |             6 |      1 |
|            1 |               1 |             7 |      1 |
|            1 |               1 |             8 |      1 |
|            1 |               1 |            18 |      2 |
|            1 |               6 |            19 |      4 |
|            1 |               6 |            20 |      2 |
|            1 |               6 |            21 |      2 |
|            1 |               6 |            22 |      3 |
|            2 |               5 |            10 |      3 |
|            2 |               5 |            11 |      4 |
|            2 |               5 |            12 |      6 |
|            2 |               5 |            13 |      7 |
|            2 |               5 |            18 |      5 |
|            2 |               9 |             1 |      4 |
|            2 |               9 |             2 |      4 |
|            2 |               9 |             3 |      2 |
|            2 |               9 |             4 |      3 |
|            2 |               9 |             5 |      1 |
|            2 |               9 |             6 |      1 |
|            2 |               9 |             7 |      1 |
|            2 |               9 |             8 |      1 |
|            2 |               9 |             9 |      3 |
|            2 |               9 |            10 |      2 |
|            2 |               9 |            11 |      4 |
|            2 |               9 |            12 |      2 |
|            2 |               9 |            13 |      2 |
|            2 |               9 |            14 |      3 |
|            2 |               9 |            15 |      3 |
|            2 |               9 |            16 |      1 |
|            2 |               9 |            17 |      2 |
|            2 |               9 |            18 |      6 |
|            3 |               2 |             1 |      1 |
|            3 |               2 |             4 |      4 |
|            3 |               2 |             5 |      3 |
|            3 |               2 |             6 |      2 |
|            4 |               3 |             6 |      1 |
|            4 |               3 |            10 |      1 |
|            4 |               3 |            11 |      2 |
|            4 |               3 |            12 |      1 |
|            4 |               3 |            13 |      1 |
|            4 |               3 |            14 |      1 |
|            4 |               3 |            17 |      5 |
|            4 |               3 |            18 |      3 |
|            4 |               8 |             1 |      3 |
|            4 |               8 |             2 |      2 |
|            4 |               8 |            14 |      2 |
|            4 |              11 |             3 |      5 |
|            4 |              11 |             8 |      3 |
|            4 |              11 |            11 |      2 |
|            4 |              11 |            13 |      1 |
|            4 |              11 |            15 |      4 |
|            5 |               7 |             3 |      2 |
|            5 |               7 |             4 |      4 |
|            5 |              10 |             1 |      5 |
|            5 |              10 |             6 |      6 |
|            5 |              10 |            10 |      7 |
|            5 |              10 |            13 |      8 |
|            5 |              10 |            19 |      1 |
|            5 |              10 |            21 |      2 |
|            6 |               4 |             1 |      3 |
|            6 |               4 |             2 |      4 |
|            6 |               4 |             3 |      2 |
|            6 |               4 |             4 |      3 |
|            6 |               4 |             5 |      2 |
|            6 |               4 |             6 |      1 |
|            6 |               4 |             9 |      2 |
|            6 |               4 |            15 |      3 |
+--------------+-----------------+---------------+--------+
'''
