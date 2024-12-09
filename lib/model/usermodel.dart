class User {
  String id;
  String username;
  String phone;
  String email;

  User({
    required this.id,
    required this.username,
    required this.phone,
    required this.email,
  });

  // Example of a factory constructor for creating a User from a Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  // Example of a method to convert a User to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'phone': phone,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, phone: $phone, email: $email}';
  }
}
