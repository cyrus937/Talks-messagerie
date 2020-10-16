class User{

  int _idUser;
  String _username;
  String _email;
  String _password;
  String _flagLogged;

  User(this._idUser,this._username, this._email,this._password,this._flagLogged);

  User.map(dynamic obj){
    this._idUser = obj['idUser'];
    this._username = obj['username'];
    this._email = obj['email'];
    this._password = obj['password'];
    this._flagLogged = obj['password'];
  }

  int get idUser => _idUser;
  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get flagLogged => _flagLogged;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["email"] = _email;
    map["password"] = _password;
    map["flagLogged"] = _flagLogged;

    if (_idUser != null){
      map["idUser"] = _idUser;
    }

    return map;
  }
}