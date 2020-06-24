class User {
  int id;
  String username;
  String email;
  String password;

  User({this.id,this.username,this.email,this.password});

  //using map data to create user
  factory User.fromJson(Map<String,dynamic> map){
    return User(
      id:1,
      username: map["username"],
      email: map["email"],
      password: map["password"]
    );

  }
  //creating a map of the from user
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "password": password
    };
  }
}
