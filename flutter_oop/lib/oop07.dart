class GameObject {
  String name;
  int posX;
  int posY;

  GameObject({required this.name, this.posX = 0, this.posY = 0});

  void despawn() {
    print("Object $name removed from the world.");
  }
}

abstract class DamageableObject extends GameObject {
  int maxHealth;
  int _health;

  DamageableObject({
    required super.name,
    required this.maxHealth,
    super.posX,
    super.posY,
  }) : _health = maxHealth;

  bool isDead() => _health <= 0;

  void takeDamage(int damage) {
    _health -= damage;
    print("$name got $damage damage. Remained HP: $_health");
    if (isDead()) {
      onKilled();
    }
  }

  void onKilled();
}

class Player extends DamageableObject {
  int score = 0;
  int livesRemaining;

  Player({
    required super.name,
    required super.maxHealth,
    this.livesRemaining = 3,
  });

  @override
  void onKilled() {
    livesRemaining--;
    print("Player $name dead! Lives remained: $livesRemaining");
  }
}

class Monster extends DamageableObject {
  int threatLevel;
  String color; //

  Monster({
    required super.name,
    required super.maxHealth,
    required this.threatLevel,
    required this.color,
  });

  String makeNoise() {
    return "RRRRRRR!";
  }

  @override
  void onKilled() {
    print("Monster $name defeated and crumbled into gold!");
    despawn();
  }
}

void main() {
  var hero = Player(name: "Olek", maxHealth: 100);
  var orc = Monster(
    name: "Jlob",
    maxHealth: 50,
    threatLevel: 5,
    color: "Green",
  );

  print(orc.makeNoise());
  orc.takeDamage(60);
  print('Winner: ${hero.name}, Helth ${hero._health}');
}
