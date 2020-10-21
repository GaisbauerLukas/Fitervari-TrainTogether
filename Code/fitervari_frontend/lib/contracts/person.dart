class Person {
  int id;
  String name;

  // later implement here a photo
  int pictureId;

  Person(this.id, this.name, this.pictureId) {}

  Person.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    pictureId = json["pictureId"];
  }
}
