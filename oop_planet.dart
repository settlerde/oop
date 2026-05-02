enum Planet { earth, mars, jupiter, moon }

class Weight {
  double kg;

  Weight._internal(this.kg);

  Weight.onMars(double weight) : this._internal(weight * 0.38);
  Weight.onMoon(double weight) : this._internal(weight * 0.16);
  Weight.onJupiter(double weight) : this._internal(weight * 2.36);

  Weight.fromPlanet(double weight, Planet planet)
    : this._internal(_convertWeight(weight, planet));

  static double _convertWeight(double weight, Planet planet) {
    switch (planet) {
      case Planet.earth:
        return weight;
      case Planet.mars:
        return weight * 0.38;
      case Planet.jupiter:
        return weight * 2.36;
      case Planet.moon:
        return weight * 0.16;
    }
  }
}

void main() {
  var myWWeightOnEarth = Weight.fromPlanet(95, Planet.earth);
  var myWeightOnMars = Weight.fromPlanet(93, Planet.mars);
  var myWeightOnJupiter = Weight.fromPlanet(93, Planet.jupiter);
  var myWeightOnMoon = Weight.fromPlanet(93, Planet.moon);

  print("Gewicht auf der Erde: ${myWWeightOnEarth.kg} kg");
  print("Gewicht auf dem Mars: ${myWeightOnMars.kg} kg");
  print("Gewicht auf dem Jupiter: ${myWeightOnJupiter.kg} kg");
  print("Gewicht auf dem Mond: ${myWeightOnMoon.kg} kg");

  print(myWeightOnMoon.kg);
  print(Weight.onMars(95).kg);
}
