/// test
void findBestVan(int requiredVolume) {
  List<int> vanVolumes = [
    1200,
    800,
    2000,
    1100,
  ]; // VanService.getVanCapacities();

  int bestVan = -1;
  int maxVolume = 5000;

  for (int i = 0; i < vanVolumes.length; i++) {
    if (vanVolumes[i] >= requiredVolume) {
      if (vanVolumes[i] < maxVolume) {
        bestVan = i;
        maxVolume = vanVolumes[i];
      }
    }
  }
  if (bestVan == -1) {
    print('Kein Lieferwagen ist groß genug');
  } else {
    print('"Bester Lieferwagen: $maxVolume L (Index: $bestVan)');
  }
}

void main() {
  findBestVan(1000);
}
