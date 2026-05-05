enum MeasurementSystem {
  mm(1.0),
  cm(10.0),
  dm(100.0),
  m(1000.0),
  inch(25.4),
  feet(304.8);

  final double toMmFactor;

  const MeasurementSystem(this.toMmFactor);
}

class Triangle {
  double _widthInMm;
  double _heightInMm;

  Triangle(this._widthInMm, this._heightInMm);

  double get widthInMeters => _widthInMm / MeasurementSystem.m.toMmFactor;
  double get heightInMeters => _heightInMm / MeasurementSystem.m.toMmFactor;

  double get widthInInches => _widthInMm / MeasurementSystem.inch.toMmFactor;
  double get heightInInches => _heightInMm / MeasurementSystem.inch.toMmFactor;

  set widthInMeters(double value) =>
      _widthInMm = value * MeasurementSystem.m.toMmFactor;
  set heightInMeters(double value) =>
      _heightInMm = value * MeasurementSystem.m.toMmFactor;

  set widthInInches(double value) =>
      _widthInMm = value * MeasurementSystem.inch.toMmFactor;
  set heightInInches(double value) =>
      _heightInMm = value * MeasurementSystem.inch.toMmFactor;
}

void main() {
  var t = Triangle(200, 150);
  print(t.widthInInches); // getter konvertiert automatisch in Zoll
  t.widthInMeters = 1.5; // setter gespeichert in mm, aber wir geben Meter an
}
