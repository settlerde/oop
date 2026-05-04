class CoinStack {
  List<int> _coinsList;
  CoinStack(this._coinsList);
  int get totalValue {
    int sum = 0;
    for (int coin in _coinsList) {
      sum += coin;
    }
    return sum;
  }

  CoinStack operator +(CoinStack other) {
    return CoinStack([..._coinsList, ...other._coinsList]);
  }

  CoinStack? operator -(CoinStack other) {
    List<int> tempList = List.from(this._coinsList);
    for (int coin in other._coinsList) {
      if (tempList.remove(coin)) {
      } else {
        return null;
      }
    }
    return CoinStack(tempList);
  }

  bool operator >(CoinStack other) {
    return this.totalValue > other.totalValue;
  }

  bool operator <(CoinStack other) {
    return this.totalValue < other.totalValue;
  }

  bool operator >=(CoinStack other) {
    return this.totalValue >= other.totalValue;
  }

  bool operator <=(CoinStack other) {
    return this.totalValue <= other.totalValue;
  }

  @override
  bool operator ==(Object other) {
    if (other is CoinStack) {
      return this.totalValue == other.totalValue;
    }
    return false;
  }

  @override
  String toString() {
    return 'CoinStack(Coins: $_coinsList, Total: $totalValue)';
  }

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
    print('Result of deduction: ${result}');
  } else {
    print('Deduction is impossible!');
  }
}
