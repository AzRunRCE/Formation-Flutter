class User {
  User(this.username, this.name, this.password);
  String username;
  String password;
  String name;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    return data;
  }

  static User fromJson( Map<String, dynamic> data) {
    return User( data['username'],  data['name'], data['password']);
  }
}
