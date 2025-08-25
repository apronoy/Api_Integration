class Usermodel {
  final int id;
  final int age;
  final String firstname;
  final String lastname;

  Usermodel( 
      {required this.id, required this.firstname, required this.lastname, required this.age});

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
        id: json['id'],
        firstname: json['firstName'],
        lastname: json['lastName'], age: json['age']);
  }
}
