enum MeasurementSystem { mm, cm, dm, m, inch, feet }

class Triangle {
  final double widthInMm;
  final double heightInMm;

  // 8) Внутренний конструктор
  Triangle._internal(this.widthInMm, this.heightInMm);

  // 6) Именованный конструктор для сантиметров
  // 9) Перенаправляет (redirection) на внутренний
  Triangle.fromCm(double width, double height)
    : this._internal(width * 10, height * 10);

  // Дверь для тех, у кого метры
  Triangle.fromM(double width, double height)
    : this._internal(width * 1000, height * 1000); // Умножаем на 1000

  // 7) Конструктор, принимающий систему измерения
  Triangle.fromSystem(double width, double height, MeasurementSystem system)
    : this._internal(_convertToMm(width, system), _convertToMm(height, system));

  // Вспомогательная функция для перевода (п. 5)
  static double _convertToMm(double value, MeasurementSystem system) {
    switch (system) {
      case MeasurementSystem.cm:
        return value * 10;
      case MeasurementSystem.m:
        return value * 1000;
      case MeasurementSystem.inch:
        return value * 25.4;
      default:
        return value;
    }
  }
}

void main() {
  // Создаем треугольник, передавая метры
  var myTriangle = Triangle.fromCm(1.5, 2.0);
  var myTriangle2 = Triangle.fromM(1.5, 2.0);
  var myTriangle3 = Triangle.fromSystem(1.5, 2.0, MeasurementSystem.inch);

  // Выводим результат. Хотя мы давали 1.5 метра, напечатает 1500 мм
  print("Ширина в мм: ${myTriangle.widthInMm}");
  print("Высота в мм: ${myTriangle.heightInMm}");
  print("Ширина в мм: ${myTriangle2.widthInMm}");
  print("Высота в мм: ${myTriangle2.heightInMm}");
  print("Ширина в мм: ${myTriangle3.widthInMm}");
  print("Высота в мм: ${myTriangle3.heightInMm}");
}
