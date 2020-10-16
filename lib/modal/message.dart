import 'package:talks/modal/user.dart';

class Message {
   int idMesssage;
   User sender;
   String time;
   String text;
   bool unread;

  Message(this.sender, this.time, this.text, this.unread, this.idMesssage);

  Message.map(dynamic obj){
    this.idMesssage = obj['idMessage'];
    this.sender = new User(obj['idUser'], null, null, null, null);
    this.time = obj['time'];
    this.text = obj['message'];
    this.unread = obj['unread'] == 'false';
  }

  Map<String, dynamic> toMap(){
    var map = new Map <String, dynamic>();
    map["idUser"] = sender.idUser;
    map["time"] = time;
    map["message"] = text;
    map["unread"] = unread;

    if(idMesssage != null)
      {
        map["idMessage"] = idMesssage;
      }

    return map;
  }
}