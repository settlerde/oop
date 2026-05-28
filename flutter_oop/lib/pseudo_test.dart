class Person {
  final String name;
  int _age;

  Person(this.name, this._age);

  void showInfo() {
    print('$name is $_age years old.');
  }

  void haveBirthday() {
    _age++;
    print('Happy Birthday $name you are $_age now');
  }

  void sayHello() {
    print('Hello, my name is $name!');
  }

  int get age => _age;

  set age(int newAge) {
    if (age < 0 || age > 150) {
      print('Invalid age');
    } else {
      _age = newAge;
    }
  }

  String get info => '$name is $age years old, and can drive: ${isAdult()}';

  bool isAdult() {
    return _age >= 18;
  }

  bool canDrive() {
    return isAdult();
  }
}

class Car {
  final String brand;
  final String model;
  final int year;

  const Car(this.brand, this.model, this.year);

  void showCarInfo() {
    print('This is a $brand $model from $year.');
  }
}

void main() {
  Person olek = Person('Olek', 51);
  Person sveta = Person('Svetik', 16);
  Car nissan = Car('Nissan', 'Note', 2016);

  olek.sayHello();
  sveta.showInfo();
  sveta.sayHello();
  sveta.haveBirthday();
  sveta.age = 151;

  print(olek.info);
  print(sveta.age);

  nissan.showCarInfo();
}
