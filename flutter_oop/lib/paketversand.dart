/// Gegeben: Service ShippingService mit den Methoden.
class ShippingService {
  final List<int> _deliveryTimes = [10, 50, 30, 20];
  final List<bool> _canceledStatus = [false, false, true, false];
  final List<bool> _paidStatus = [true, false, true, true];
  final List<bool> _expressStatus = [false, true, false, true];

  /// Lieferzeiten in Stunden
  List<int> getDeliveryTimes() => _deliveryTimes;

  /// [true], wenn das Paket storniert ist, sonst [false]
  bool isCanceled(int index) => _canceledStatus[index];

  /// true”, wenn das Paket bezahlt ist, sonst “false”
  bool isPaid(int index) => _paidStatus[index];

  ///  “true”,  wenn  Expressversand,  sonst “false”
  bool isExpress(int index) => _expressStatus[index];
}

void main() {
  int resultIndex = findLongestRelevantDeliveryIndex(ShippingService());

  print('Index of the longest matching package: $resultIndex');
}

/// Die Hauptfunktion
int findLongestRelevantDeliveryIndex(ShippingService service) {
  List<int> deliveryTimes = service.getDeliveryTimes();

  int maxIndex = -1;
  int maxTime = -1;

  for (int i = 0; i < deliveryTimes.length; i++) {
    if (!service.isCanceled(i) && service.isPaid(i)) {
      int currentTime = deliveryTimes[i];
      bool isRelevant = false;

      if (service.isExpress(i)) {
        if (currentTime > 24) {
          isRelevant = true;
        }
      } else {
        isRelevant = true;
      }

      if (isRelevant) {
        if (currentTime > maxTime) {
          maxTime = currentTime;
          maxIndex = i;
        }
      }
    }
  }

  return maxIndex;
}
