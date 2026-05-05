enum MeasurementSystem {
  mm(1.0),
  cm(10.0),
  m(1000.0),
  inch(25.4);

  final double factor;
  const MeasurementSystem(this.factor);
}

class Triangle {
  double _widthInMm;
  double _heightInMm;

  Triangle(this._widthInMm, this._heightInMm);

  double getHeight(MeasurementSystem ms) => _heightInMm / ms.factor;
  double getWidth(MeasurementSystem ms) => _widthInMm / ms.factor;

  void setHeight(MeasurementSystem ms, double value) =>
      _heightInMm = value * ms.factor;
  void setWidth(MeasurementSystem ms, double value) =>
      _widthInMm = value * ms.factor;

  double get areaInMm2 => (_widthInMm * _heightInMm) / 2;

  double getArea(MeasurementSystem ms) {
    return areaInMm2 / (ms.factor * ms.factor);
  }
}

void main() {
  var t = Triangle(20, 10).getArea
  (MeasurementSystem.inch);
  print(t);
}
