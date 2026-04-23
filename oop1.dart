class Developer {
  String name;
  String language;
  double erfahrung;
  bool isStudent;

  Developer(
    this.name,
    this.language, [
    this.erfahrung = 0,
    this.isStudent = true,
  ]);

  void displayInfo() {
    print('Name: $name');
    print('Programming Language: $language');
  }
}

void main() {
  Developer dev1 = Developer('Yan', 'JS');
  Developer dev2 = Developer('Olek', 'Dart', 0.3);

  dev1.displayInfo();
  print('Experience: ${dev1.erfahrung}, Is Student: ${dev1.isStudent}');

  dev2.displayInfo();
  print('Experience: ${dev2.erfahrung}, Is Student: ${dev2.isStudent}');
}
