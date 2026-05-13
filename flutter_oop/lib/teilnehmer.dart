
/// Erstellt eine Kopie des aktuellen [Teilnehmer]-Objekts mit optional geänderten Attributen.
class Teilnehmer {
  /// Klassenattribut ID
  final int idNumer;

  /// KLassenattribut Name
  final String name;

  /// Optionales Attribut Email
  final String? email;

  /// Klassenkonstruktor
  Teilnehmer(this.name, this.idNumer, [this.email]);

  /// Klassenmethode [copyWith] wird ihre eigene Klasse kopiert.
  Teilnehmer copyWith({String? name, int? idNumer, String? email}) {
    // Immutability
    return Teilnehmer(
      name ?? this.name,
      idNumer ?? this.idNumer,
      email ?? this.email,
    );
  }

  @override
  String toString() => 'Teilnehmer(ID: $idNumer, Name: $name, Email: $email)';
}

void main() {
  final user = Teilnehmer('Olek', 777);
  final user2 = user.copyWith(idNumer: 333, email: 'user@email.de');
  final user3 = user.copyWith(email: 'no data', idNumer: 123);
  print(user);
  print(user2);
  print(user3);
}
