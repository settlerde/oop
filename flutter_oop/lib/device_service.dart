// Der Service DeviceService mit der Methode:
class DeviceService {
  List<int> getBatteryLevels() {
    // Methode die Akkustände ausgibt
    return [
      45,
      12,
      78,
      8,
      25,
      15,
      92,
      3,
      67,
      12,
    ]; //  Akkustände in Prozent (0–100), N ≥ 1
  }
}

// Die haupt Funktion
void analyzeLowestBattery() {
  DeviceService service = DeviceService();

  // Das Array der Akkustände laden.
  List<int> batteryLevels = service.getBatteryLevels();

  // Initialisierung
  int minBattery = batteryLevels[0]; // ab erste fangen an - [0]
  int minIndex = 0;
  int criticalCount = 0;

  // Array durch passen
  for (int i = 0; i < batteryLevels.length; i++) {
    // Kritische Geräte rechnen (< 20%)
    if (batteryLevels[i] < 20) {
      criticalCount++;
    }

    // Niedrigster Akkustand und Index finden
    if (batteryLevels[i] < minBattery) {
      minBattery = batteryLevels[i];
      minIndex = i;
    }
  }

  // Ausgabe
  print(
    'Niedrigster Akkustand: $minBattery% (Gerät-Index: $minIndex), Kritische Geräte (<20%): $criticalCount',
  );
}

void main() {
  analyzeLowestBattery(); // Implementieren
}
