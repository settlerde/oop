class Maket {
  double maxLength = 122;
  double minLength = 118;
  double maxWidth = 82;
  double minWidth = 78;
  bool isDeffect = false;
  void checkPart(double length, double width, bool isDeffect) {
    if (length >= minLength &&
        length <= maxLength &&
        width >= minWidth &&
        width <= maxWidth &&
        isDeffect) {
      print('OK: Teil innerhalb der Toleranz');
    } else {
      print('Fehler: Teil außerhalb der Toleranz');
    }
  }
}

void qualityCheck(double length, double width, bool isDeffect) {
  Maket product = Maket();
  product.checkPart(length, width, isDeffect);
}

void main() {
  qualityCheck(120, 80, true);
  qualityCheck(123, 80, false);
}
