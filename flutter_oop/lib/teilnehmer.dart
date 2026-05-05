/// Ein Klass
class Teilnehmer {
  /// Klassenattribut ID
  final int idNumer;

  /// KLassenattribut Name
  final String name;

  /// Optionales Attribut Email
  final String? email;

  /// Klassenkonstruktor
  Teilnehmer(this.name, this.idNumer, [this.email]);

  /// Klassenmethode 'Kopieren'
  Teilnehmer copyWith({String? name, int? idNumer, Function(String?)? email}) {
    return Teilnehmer(
      name ?? this.name,
      idNumer ?? this.idNumer,
      email != null ? email(this.email) : this.email,
    );
  }

  @override
  String toString() => 'Teilnehmer(ID: $idNumer, Name: $name, Email: $email)';
}

void main() {
  final user = Teilnehmer('Olek', 777);
  final user2 = user.copyWith(idNumer: 333, email: (email) => 'user@email.de');
  print(user);
  print(user2);
}
