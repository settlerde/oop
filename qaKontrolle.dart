class Maket {
  double maxLength = 122;
  double minLength = 118;
  double maxWidth = 82;
  double minWidth = 78;
  bool defect = false;
  void checkPart(length, width, defect) {
    if (length >= minLength &&
        length <= maxLength &&
        width >= minWidth &&
        width <= maxWidth &&
        !defect) {
      print('OK: Teil innerhalb der Toleranz');
    } else {
      print('Makel: Teil außerhalb der Toleranz');
    }
  }
}

void qualityCheck(double length, double width, bool defect) {
  Maket product = Maket();
  product.checkPart(length, width, defect);
}

String qualityCheck2(double value, double min, double max, bool defect) {
  if (value >= min && value <= max && !defect) {
    return 'OK: Teil innerhalb der Toleranz';
  } else {
    return 'Makel: Teil außerhalb der Toleranz';
  }
}

void main() {
  qualityCheck(120, 85, false);
  qualityCheck(123, 80, true);
  qualityCheck(121, 79, false);
  print(qualityCheck2(15, 10, 20, false));
}
