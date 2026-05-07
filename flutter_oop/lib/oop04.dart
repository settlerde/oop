import 'dart:math';

// --- Komposition (Composition) ---

/// Repräsentiert die geschlechtliche Identität eines Teilnehmers.
/// Wird als [enum] verwendet, um Typischerheit zu gewärleisten.
enum Geschlecht { maennlich, weiblich, divers }

/// Generiert einen einduetiger Code für jeden Teilnehmer.
class Zutrittsberechtigung {
  /// Ein zufällig generierter numerischer Code.
  final int code;

  /// Erstellt eine Instanz mit einem Zufallswert zwischen 0 und 999.999.999.
  Zutrittsberechtigung() : code = Random().nextInt(1000000000);
}

/// Repräsentiert eine Person, die an einem Kurs teilnehmt.
/// Enthält persönliche Daten und eine [Zutrittsberechtigung].
class Teilnehmer {
  final String vorname;
  final String name;
  final Geschlecht geschlecht;

  /// Die Berechtigung wird direkt bei der Erstellung des Teilnehmers generiert.
  final Zutrittsberechtigung berechtigung;

  /// Ausgibt die [Zutrittsberechtigung].
  Teilnehmer(this.vorname, this.name, this.geschlecht)
    : berechtigung = Zutrittsberechtigung();
}

// --- Aggregation ---

/// Repräsentiert einen Bildungskurs mit einem Titel und einer Liste von Teilnemern.
class Kurs {
  final String titel;
  final List<Teilnehmer> teilnehmerListe = [];

  /// Konstruktor enthält nur Titel.
  Kurs(this.titel);

  /// Die Methode nimmt einen Teilnehmer entgegen und fügt ihn zue Liste hinzu.
  void addTeilnehmer(Teilnehmer type) {
    teilnehmerListe.add(type);
  }
}

/// Die Hauptklasse der Akademie, die verschidene Kurse verwaltet.
class Cdemy {
  /// Eine Sammlung aller verfügbaren Kurse in der Akademie.
  final List<Kurs> kurse = [];

  /// Die Methode nimmt einen Kurs entgegen und fügt ihn zu Liste hinzu.
  void addKurs(Kurs udemyKurs) {
    kurse.add(udemyKurs);
  }
}

void main() {
  Cdemy myCdemy = Cdemy();

  Kurs dartKurs = Kurs('Dart Profi');
  Kurs pythonKurs = Kurs('Python zero to hero');
  Kurs webDevKurs = Kurs('Web Development');

  myCdemy.addKurs(dartKurs);
  myCdemy.addKurs(pythonKurs);
  myCdemy.addKurs(webDevKurs);
  // Erstellung der Teilnehmer
  Teilnehmer t1 = Teilnehmer('Olek', 'Melnychenko', Geschlecht.maennlich);
  Teilnehmer t2 = Teilnehmer('Maria', 'Jason', Geschlecht.weiblich);
  Teilnehmer t3 = Teilnehmer('Alex', 'Seasharp', Geschlecht.divers);
  // Zuweisung der Teilnehmer zu den Kursen
  dartKurs.addTeilnehmer(t1);
  webDevKurs.addTeilnehmer(t2);
  pythonKurs.addTeilnehmer(t3);
  // Ausgabe der Struktur
  print('Cdemy Kurse:');
  for (var kurs in myCdemy.kurse) {
    print('-- ${kurs.titel} --');
    print('  Teilnehmer:');
    for (var teilnehmer in kurs.teilnehmerListe) {
      print(
        '  - ${teilnehmer.vorname}, ${teilnehmer.name}, ${teilnehmer.geschlecht.name}, Code: ${teilnehmer.berechtigung.code}',
      );
    }
  }
}
