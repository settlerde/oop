/// Eine Klasse die eine Liste zurückgibt
class DeviceService {
  /// List ist static für globalen Zugriff
  static List<int> getBatteryLevels() {
    return [45, 22, 28, 10, 15, 99];
  }
}

/// Funktion die Daten einer Liste vergleicht
void analyzeLowestBattery() {
  List<int> batteryLevels = DeviceService.getBatteryLevels();

  int minAkku = batteryLevels[0];
  int minIndex = 0;
  int criticalCount = 0;

  for (int i = 0; i < batteryLevels.length; i++) {
    if (batteryLevels[i] < minAkku) {
      minAkku = batteryLevels[i];
      minIndex = i + 1;
    }
    if (batteryLevels[i] < 20) {
      criticalCount++;
    }
  }
  print('Niedrigster Akkustand: $minAkku %');
  print('Gerät-Index: $minIndex');
  print('Kritische Geräte (<20%): $criticalCount');
}

void main() {
  analyzeLowestBattery();
}

/// Pseudocode auf dem der Code basiert

/*
START

CLASS DeviceService
    METHOD getBatteryLevels(): INTEGER[]
        RETURN [45, 12, 78, 19, 5]
    END METHOD
END CLASS

FUNCTION analyzeLowestBattery()

    SET batteryLevels = DeviceService.getBatteryLevels()

    SET min = batteryLevels[0]
    SET minIndex = 0
    SET criticalCount = 0

    FOR i FROM 0 TO length(batteryLevels)

        IF batteryLevels[i] < min THEN
            SET min = batteryLevels[i]
            SET minIndex = i
        END IF

        IF batteryLevels[i] < 20 THEN
            SET criticalCount = criticalCount + 1
        END IF

    END FOR

    OUTPUT "Niedrigster Akkustand: " + min + "% (Gerät-Index: " + minIndex + "), Kritische Geräte (<20%): " + criticalCount

END FUNCTION

END
*/
