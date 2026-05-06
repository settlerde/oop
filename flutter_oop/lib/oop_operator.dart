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
    List<int> tempList = List.from(_coinsList);
    for (int coin in other._coinsList) {
      if (tempList.remove(coin)) {
      } else {
        return null;
      }
    }
    return CoinStack(tempList);
  }

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
  var otherStack = CoinStack([10, 5]);

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
