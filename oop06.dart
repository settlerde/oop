class Human {
  String name;
  Human(this.name);
  void speach() {
    print('$name is speaking.');
  }

  void walk() {
    print('Walking');
  }
}

class Man extends Human {
  Man(super.name);
  void eat() {
    print('Can eat');
  }
}

class Woman extends Human {
  Woman(super.name);
  void dance() {
    print('Can dance');
  }
}

// abstract class Animal {
//   void move();
//   void makeSound();
// }

// abstract interface class CanFly {
//   void fly();
// }

// abstract interface class CanWalk {
//   void walk();
// }

// abstract interface class CanBreatheUnderWater {
//   void breathe();
// }

// abstract class Fish extends Animal implements CanBreatheUnderWater {
//   @override
//   void move() => print("Sweem under water");

//   @override
//   void breathe() => print("Breathes under water");
// }

// class Goldfish extends Fish {
//   @override
//   void makeSound() => print("Glucks-glucks");
// }

// class Eagle extends Animal implements CanFly {
//   @override
//   void move() => print("Flies high in the sky");

//   @override
//   void fly() => print("Flaps its powerful wings");

//   @override
//   void makeSound() => print("Der Schrei eines Adlers");
// }

// void globalFly(Object? creature) {
//   if (creature is CanFly) {
//     print("flying creature");
//     creature.fly();
//   } else {
//     print("The creatur cant fly.");
//   }
// }

// void main() {
//   var myFish = Goldfish();
//   var myEagle = Eagle();
//   var myStone = "NJust a stone";

//   print("Checking the eagle");
//   globalFly(myEagle);

//   print("\nChecking the fish");
//   globalFly(myFish);

//   print("\nChecking the stone");
//   globalFly(myStone);
// }
