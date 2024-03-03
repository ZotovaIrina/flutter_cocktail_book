class Ingridient {
  String name = '';
  String? description;

  Ingridient(this.name, this.description);

  save() {
    print('Save! ${name} ${description}');
  }
}
