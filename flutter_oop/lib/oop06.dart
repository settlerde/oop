abstract class Animal {
  void move();
  void makeSound();
}

abstract class CanFly {
  void fly();
}

abstract class CanBreatheUnderWater {
  void breatheUnderWater();
}

abstract class Fish extends Animal implements CanBreatheUnderWater {
  @override
  void breatheUnderWater() {
    print('Can breathe under water');
  }

  @override
  void move() {
    print('Swimming under the water');
  }
}

class Goldfish extends Fish {
  @override
  void makeSound() {
    print('Bulb-bulb');
  }
}

class Bird extends Animal implements CanFly {
  @override
  void fly() {
    print('The bird is flying in the sky');
  }

  @override
  void makeSound() {
    print('Tweet-tweet');
  }

  @override
  void move() {
    print('Bird is flying');
  }
}

void globalFly(Object creature) {
  if (creature is CanFly) {
    CanFly flyngCreature = creature;
    print('Flying creature');
    flyngCreature.fly();
  } else {
    print('Creature is not flying');
  }
}

void main() {
  var myBird = Bird();
  var myFish = Goldfish();
  print('Checking if ti can fly: \n');
  globalFly(myFish);
  globalFly(myBird);
}
