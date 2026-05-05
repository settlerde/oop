class Developer {
  String name;
  String language;
  double expirienceYear;
  bool isStudent;

  Developer(
    this.name,
    this.language, [
    this.expirienceYear = 0,
    this.isStudent = true,
  ]);

  void displayInfo() {
    print('Name: $name');
    print('Programming Language: $language');
  }
}

void main() {
  Developer dev1 = Developer('Yan', 'JS');
  Developer dev2 = Developer('Olek', 'Dart', 0.2);

  dev1.displayInfo();
  print('Experience: ${dev1.expirienceYear}, Is Student: ${dev1.isStudent}\n');

  dev2.displayInfo();
  print('Experience: ${dev2.expirienceYear}, Is Student: ${dev2.isStudent}');
}
