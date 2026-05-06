/// Stellt Houptobjekt des Programms dar.
class CoinStack {
  final List<int> _coinsList;

  /// Das Objekt nimmt eine Liste von Mühzen entgegen.
  CoinStack(this._coinsList);

  /// Der Getter berechnet die Summe der Münzen in der Liste und gibt den Betrag zurük.
  int get totalValue {
    int sum = 0;
    for (int coin in _coinsList) {
      sum += coin;
    }
    return sum;
  }

  /// Der Operator [+] erstellt eine neue Liste aus zwei verschidenen Listen und gibt diese zurük.
  CoinStack operator +(CoinStack other) {
    return CoinStack([..._coinsList, ...other._coinsList]);
  }

  /// Der Operator [-] vergleicht zwei Listen und entfernt alle doppelten Münzen, um anschlißend eine neue Liste zurükzugiben.
  CoinStack? operator -(CoinStack other) {
    List<int> tempList = _coinsList;
    for (int i = 0; i < other._coinsList.length; i++) {
      print("Versuch $i: ${other._coinsList[i]}");
      print("Versuch $i: ${tempList[i]}");

      tempList[i] - other._coinsList[i];
    }
    return CoinStack(tempList);
  }

  // CoinStack? operator -(CoinStack other) {
  //   List<int> tempList = _coinsList;
  //   bool isRemove = false;
  //   for (int i = 0; i < other._coinsList.length; i++) {
  //     print("Erste for: ${other._coinsList[i]}");
  //     print(_coinsList);
  //     print(other._coinsList);
  //     for (int j = 0; j < tempList.length; j++) {
  //       print("Zweite for versuch $i: ${other._coinsList[i]}");
  //       print("Zweite for versuch $j ${tempList[j]}");

  //       if (other._coinsList[i] == tempList[j]) {
  //         print("true");
  //         tempList.remove(tempList[j]);
  //         isRemove = true;
  //       }
  //     }
  //   }
  //   return isRemove ? CoinStack(tempList) : null;
  // }

  /// Der Vergleichoperator [>] vergleicht die Summen zweier Listen.
  bool operator >(CoinStack other) {
    return totalValue > other.totalValue;
  }

  /// Der Vergleichoperator [<] vergleicht die Summen zweier Listen und gibt einen boolischen WErt zurück.

  bool operator <(CoinStack other) {
    return totalValue < other.totalValue;
  }

  /// Der Vergleichoperator [>=] vergleicht die Summen zweier Listen und gibt einen boolischen Wert zurück.

  bool operator >=(CoinStack other) {
    return totalValue >= other.totalValue;
  }

  /// Der Vergleichoperator [<=] vergleicht die Summen zweier Listen und gibt einen boolischen Wert zurück.

  bool operator <=(CoinStack other) {
    return totalValue <= other.totalValue;
  }

  @override
  bool operator ==(Object other) {
    if (other is CoinStack) {
      return totalValue == other.totalValue;
    }
    return false;
  }

  @override
  String toString() {
    return 'CoinStack(Coins: $_coinsList, Total: $totalValue)';
  }

  @override
  int get hashCode => totalValue.hashCode;
}

void main() {
  var myStack = CoinStack([5, 10, 20]);
  var otherStack = CoinStack([1, 63, 5]);

  print('My Stack: $myStack (Total: ${myStack.totalValue})');
  print('Other stack: $otherStack (Total: ${otherStack.totalValue})');

  print('Is my stack bigger? ${myStack > otherStack}');

  var combined = myStack + otherStack;
  print('Result of addition: $combined');

  var result = myStack - otherStack;
  if (result != null) {
    print('Result of deduction: $result');
  } else {
    print('Deduction is impossible!');
  }
}
