enum Planet { Earth, Mars, Jupiter, Moon }

class Weight {
  double kg;

  Weight._internal(this.kg);

  // Weight.fromMars(double weight) : this._internal(weight * 0.38);
  // Weight.fromMoon(double weight) : this._internal(weight * 0.16);
  // Weight.fromJupiter(double weight) : this._internal(weight * 2.36);

  Weight.fromPlanet(double weight, Planet planet)
    : this._internal(_convertWeight(weight, planet));

  static double _convertWeight(double weight, Planet planet) {
    switch (planet) {
      case Planet.Earth:
        return weight;
      case Planet.Mars:
        return weight * 0.38;
      case Planet.Jupiter:
        return weight * 2.36;
      case Planet.Moon:
        return weight * 0.16;
    }
  }
}

void main() {
  var myWWeightOnEarth = Weight.fromPlanet(93, Planet.Earth);
  var myWeightOnMars = Weight.fromPlanet(93, Planet.Mars);
  var myWeightOnJupiter = Weight.fromPlanet(93, Planet.Jupiter);
  var myWeightOnMoon = Weight.fromPlanet(93, Planet.Moon);

  print("Gewicht auf der Erde: ${myWWeightOnEarth.kg} kg");
  print("Gewicht auf dem Mars: ${myWeightOnMars.kg} kg");
  print("Gewicht auf dem Jupiter: ${myWeightOnJupiter.kg} kg");
  print("Gewicht auf dem Mond: ${myWeightOnMoon.kg} kg");
}
