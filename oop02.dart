enum MeasurementSystem { mm, cm, dm, m, inch, feet }

class Triangle {
  final double widthInMm;
  final double heightInMm;

  // Internal / Private Constructor
  Triangle._internal(this.widthInMm, this.heightInMm);

  // Bennanter Konstruktor (optional)
  // redirection : _internal
  Triangle.fromCm(double width, double height)
    : this._internal(width * 10, height * 10);

  // Konstruktor für MesurementSystem
  Triangle.fromSystem(double width, double height, MeasurementSystem system)
    : this._internal(_convertToMm(width, system), _convertToMm(height, system));

  // Hilfsfunktion zur Umrechnung in mm
  static double _convertToMm(double value, MeasurementSystem system) {
    // Control Flow Statement
    switch (system) {
      case MeasurementSystem.mm:
        return value;
      case MeasurementSystem.cm:
        return value * 10;
      case MeasurementSystem.dm:
        return value * 100;
      case MeasurementSystem.m:
        return value * 1000; // literal 1000
      case MeasurementSystem.inch:
        return value * 25.4;
      default:
        return value;
    }
  }
}

void main() {
  var myTriangle = Triangle.fromCm(1.5, 2.0);
  var myTriangle2 = Triangle.fromSystem(1.5, 2.0, MeasurementSystem.dm);

  print("Ширина в мм: ${myTriangle.widthInMm}");
  print("Высота в мм: ${myTriangle.heightInMm}");
  print(
    "Breite / Höhe in mm: ${myTriangle2.widthInMm} / ${myTriangle2.heightInMm}",
  );
}
