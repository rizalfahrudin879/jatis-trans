class User {
  String _username;
  String _password;

  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj['username'];
    this._password = obj['password'];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
     this._username = map['username'];
    this._password = map['password'];
    print(this._username);
    print(this._password);
  }
}
