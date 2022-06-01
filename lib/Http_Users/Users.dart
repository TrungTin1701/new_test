// ignore_for_file: file_names

class Person {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  Person(this.id, this.email, this.firstName, this.lastName, this.avatar);
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['id'],
      json['email'],
      json['first_name'],
      json['last_name'],
      json['avatar'],
    );
  }
}
