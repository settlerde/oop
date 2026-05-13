/// Basisklasse für alle Objekte im Spiel
class GameObject {
  String name;
  int posX;
  int posY;

  /// Konstruktor erstellt ein neues Objekt [name] ist erforderlich, POsition ist standmäßig (0, 0).
  GameObject({required this.name, this.posX = 0, this.posY = 0});

  /// Die Funktion anzeigt dass Objekt aus dem Spiel etfernt wurde.
  void despawn() {
    print('Object $name removed from the world.');
  }
}

/// Eine abstrakte Klasse für Objekte die Schaden erleiden können.
abstract class DamageableObject extends GameObject {
  int maxHealth;
  int _health;

  /// Konstruktor des Objektes definiert neue private Variable
  DamageableObject({
    required super.name,
    required this.maxHealth,
    super.posX,
    super.posY,
  }) : _health = maxHealth;

  /// Überprüft, ob Das Objekt Noch Lebenspunkte hat.
  bool isDead() => _health <= 0;

  /// Zieht [damage] von der aktuellen Gesundheit ab.
  void takeDamage(int damage) {
    _health -= damage;
    print('$name got $damage damage. Remained HP: $_health');
    if (isDead()) {
      onKilled();
    }
  }

  /// Definition dessen was passsiert wenn Objekt stirbt.
  void onKilled();
}

/// Repräsentiert einen Spieler im Spiel.
class Player extends DamageableObject {
  int score = 0;

  /// [livesRemaining] des Spilers definiert
  int livesRemaining;

  ///
  Player({
    required super.name,
    required super.maxHealth,
    this.livesRemaining = 3,
  });

  @override
  /// Reduziert verbleibenden Leben des Spilers.
  void onKilled() {
    livesRemaining--;
    print('Player $name dead! Lives remained: $livesRemaining');
  }
}

/// Repräsentiert einen Gegner des Spilers.
class Monster extends DamageableObject {
  int threatLevel;
  String color; //
  ///
  Monster({
    required super.name,
    required super.maxHealth,
    required this.threatLevel,
    required this.color,
  });

  /// Gibt das typische Geräusch des Monsters zurück.
  String makeNoise() {
    return 'RRRRRRR!';
  }

  /// Logik von den Sieg über das Monster.
  @override
  void onKilled() {
    print('Monster $name defeated and crumbled into gold!');
    despawn();
  }
}

void main() {
  var hero = Player(name: 'Olek', maxHealth: 100);
  var orc = Monster(
    name: 'Jlob',
    maxHealth: 50,
    threatLevel: 5,
    color: 'Green',
  );

  print(orc.makeNoise());
  orc.takeDamage(60);
  print('Winner: ${hero.name}, Helth ${hero._health}');
}
