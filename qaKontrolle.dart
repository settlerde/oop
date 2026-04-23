class Maket {
  double maxLength = 122;
  double minLength = 118;
  double maxWidth = 82;
  double minWidth = 78;
  bool isDeffect = true;
  void checkPart(length, width, isDefect) {
    if (length >= minLength &&
        length <= maxLength &&
        width >= minWidth &&
        width <= maxWidth &&
        !isDeffect) {
      print('OK: Teil innerhalb der Toleranz');
    } else {
      print('Makel: Teil außerhalb der Toleranz');
    }
  }
}

void qualityCheck(double length, double width, bool isDefect) {
  Maket product = Maket();
  product.checkPart(length, width, isDefect);
}

void main() {
  qualityCheck(120, 85, false);
  qualityCheck(123, 80, true);
  qualityCheck(121, 79, false);
}
