# Rechnungsdatenbank
## Inhalt und Grund

Diese Repo beinhaltet eine SQL Datei mit Dummy-Daten, die in eine MYSql datenbank einfach importiert werden können. Diese Repo soll meine Kenntnisse in SQL und MYSQL demonstrieren. Außerdem werde ich diese Dummydatenbank in Zukunft für andere Projekte benutzten.

## ER-Diagramm

Das Schema der Datenbank richtet sich nach folgendem Er-Diagramm:

![ER-Diagramm](/assets/images/ER-Diagramm.jpg)

## Import

Als erstes muss eine neue Datenbank erstellt werden.
```
mysql> CREATE DATABASE Rechnungsdatenbank;
```

Anschließend kann die Datenbank folgendermaßen importiert werden.
```
mysql -h 'hostname' -u 'username' -p Rechnungsdatenbank < ./Rechnungsdatenbank.sql
```

## Inhalt

Die Inhalte der Datenbank sind folgende:

### Kunde
```
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
```

### Produkt
```
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
```

### Rechnung
```
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
```

### kauft
```
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
```

## mögliche SQL querys

1. Liste der Artikelnamen der Rechnung mit der Rechnungsnummer 1:
```
mysql> select p.Produktname from Produkt as p inner join kauft as ka on p.Artikelnummer=ka.Artikelnummer where ka.Rechnungsnummer=1;
+---------------+
| Produktname   |
+---------------+
| Mehl          |
| Milch         |
| Eier 10er     |
| Butter        |
| Zucker        |
| Salz          |
| Paprikapulver |
| Pfeffer       |
| Wasser        |
+---------------+
```
1. Liste aller Kunden und mit ihren Gesamtausgaben:
```
mysql> select concat(k.Nachname,', ',k.Vorname) as 'Nachname, Vorname', round(sum(p.Preis * ka.Anzahl),2) as Gesamtausgaben from Produkt as p inner join kauft as ka inner join Kunde as k inner join Rechnung as r on p.Artikelnummer=ka.Artikelnummer and k.Kundennummer=ka.Kundennummer and r.Rechnungsnummer=ka.Rechnungsnummer Group by ka.Kundennummer;
+------------------------+----------------+
| Nachname, Vorname      | Gesamtausgaben |
+------------------------+----------------+
| Metzger, Andreas       |          36.81 |
| Schmidt, Sandra        |         119.55 |
| Ebersbacher, Christian |          18.96 |
| Theiss, Brigitte       |          69.21 |
| Beich, Daniela         |          70.95 |
| Hahn, Stefan           |          38.51 |
+------------------------+----------------+

```
1. Liste aller Rechnungen mit Kundenname, Rechnungsdatum und Gesamtpreis:
```
mysql> select r.Rechnungsnummer, concat(MAX(k.Nachname),', ',MAX(k.Vorname)) as 'Nachname, Vorname', r.Rechnungsdatum, round(sum(p.Preis * ka.Anzahl),2) as Gesamtpreis from Produkt as p inner join kauft as ka inner join Kunde as k inner join Rechnung as r on p.Artikelnummer=ka.Artikelnummer and k.Kundennummer=ka.Kundennummer and r.Rechnungsnummer=ka.Rechnungsnummer Group by ka.Rechnungsnummer;
+-----------------+------------------------+----------------+-------------+
| Rechnungsnummer | Nachname, Vorname      | Rechnungsdatum | Gesamtpreis |
+-----------------+------------------------+----------------+-------------+
|               1 | Metzger, Andreas       | 2023-10-01     |       26.83 |
|               2 | Ebersbacher, Christian | 2023-10-03     |       18.96 |
|               3 | Theiss, Brigitte       | 2023-10-03     |       22.29 |
|               4 | Hahn, Stefan           | 2023-10-05     |       38.51 |
|               5 | Schmidt, Sandra        | 2023-10-10     |       39.89 |
|               6 | Metzger, Andreas       | 2023-10-13     |        9.98 |
|               7 | Beich, Daniela         | 2023-10-13     |       11.98 |
|               8 | Theiss, Brigitte       | 2023-10-20     |       12.75 |
|               9 | Schmidt, Sandra        | 2023-10-25     |       79.66 |
|              10 | Beich, Daniela         | 2023-10-27     |       58.97 |
|              11 | Theiss, Brigitte       | 2023-10-30     |       34.17 |
+-----------------+------------------------+----------------+-------------+
```
1. Liste aller Artikel mit Gesamteinnahmen absteigend sortiert:

```
mysql> select p.Produktname, round(sum(p.Preis * ka.Anzahl),2) as Gesamteinnahmen from Produkt as p inner join kauft as ka on p.Artikelnummer=ka.Artikelnummer Group by p.Artikelnummer Order by Gesamteinnahmen DESC;
+----------------+-----------------+
| Produktname    | Gesamteinnahmen |
+----------------+-----------------+
| Mehl           |           43.02 |
| Butter         |           36.55 |
| Apfel          |           34.90 |
| Tomaten        |           33.67 |
| Zwiebel        |           30.21 |
| Salz           |           22.80 |
| Eier 10er      |           20.28 |
| Wasser         |           17.44 |
| Gurken         |           16.20 |
| Eisbergsalat   |           15.21 |
| Milch          |           13.86 |
| Pfeffer        |           12.45 |
| Kartoffel      |           10.80 |
| Zucker         |            9.73 |
| Bananen        |            9.45 |
| Kugelschreiber |            7.96 |
| Sahne          |            6.00 |
| Paprikapulver  |            3.98 |
| Bleistift      |            3.95 |
| Birnen         |            2.69 |
| Radiergummi    |            2.06 |
| Heft           |            0.78 |
+----------------+-----------------+
```
1. Liste aller Artikel mit Verkaufsanzahl absteigend sortiert:

```
mysql> select p.Produktname, sum(ka.Anzahl) as Gesamteinnahmen from Produkt as p inner join kauft as ka on p.Artikelnummer=ka.Artikelnummer Group by p.Artikelnummer Order by Gesamteinnahmen;
+----------------+-----------------+
| Produktname    | Gesamteinnahmen |
+----------------+-----------------+
| Birnen         |               1 |
| Paprikapulver  |               2 |
| Radiergummi    |               2 |
| Heft           |               3 |
| Kugelschreiber |               4 |
| Bleistift      |               5 |
| Pfeffer        |               5 |
| Sahne          |               5 |
| Kartoffel      |               6 |
| Zucker         |               7 |
| Bananen        |               7 |
| Eisbergsalat   |               9 |
| Apfel          |              10 |
| Gurken         |              12 |
| Eier 10er      |              12 |
| Salz           |              12 |
| Tomaten        |              13 |
| Milch          |              14 |
| Wasser         |              16 |
| Butter         |              17 |
| Mehl           |              18 |
| Zwiebel        |              19 |
+----------------+-----------------+

```
