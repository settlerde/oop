import 'dart:math';

// Komposition
enum Geschlecht { maennlich, weiblich, divers }

class Zutrittsberechtigung {
  final int code;

  Zutrittsberechtigung() : code = Random().nextInt(1000000000);
}

class Teilnehmer {
  final String vorname;
  final String name;
  final Geschlecht geschlecht;

  final Zutrittsberechtigung berechtigung;

  Teilnehmer(this.vorname, this.name, this.geschlecht)
    : berechtigung = Zutrittsberechtigung();
}

// Aggregation
class Kurs {
  final String titel;
  final List<Teilnehmer> teilnehmerListe = [];

  Kurs(this.titel);

  void addTeilnehmer(Teilnehmer type) {
    teilnehmerListe.add(type);
  }
}

class Cdemy {
  final List<Kurs> kurse = [];

  void addKurs(Kurs udemyKurs) {
    kurse.add(udemyKurs);
  }
}

void main() {
  Cdemy myCdemy = Cdemy();

  Kurs dartKurs = Kurs('Dart Profi');
  Kurs flutterKurs = Kurs('Flutter zero to hero');
  Kurs webDevKurs = Kurs('Web Development');

  myCdemy.addKurs(dartKurs);
  myCdemy.addKurs(flutterKurs);
  myCdemy.addKurs(webDevKurs);

  Teilnehmer t1 = Teilnehmer('Olek', 'Melnychenko', Geschlecht.maennlich);
  Teilnehmer t2 = Teilnehmer('Maria', 'Jason', Geschlecht.weiblich);
  Teilnehmer t3 = Teilnehmer('Alex', 'Seasharp', Geschlecht.divers);

  dartKurs.addTeilnehmer(t1);
  webDevKurs.addTeilnehmer(t2);
  flutterKurs.addTeilnehmer(t3);

  print('Cdemy Kurse:');
  for (var kurs in myCdemy.kurse) {
    print('-- ${kurs.titel} --');
    print('  Teilnehmer:');
    for (var teilnehmer in kurs.teilnehmerListe) {
      print(
        '  - ${teilnehmer.vorname} ${teilnehmer.name} (${teilnehmer.geschlecht})',
      );
    }
  }
}
