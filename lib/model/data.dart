import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:talks/modal/message.dart';
import 'package:talks/modal/user.dart';

class DataProvider {
  static Database db;

  static bool correctInformation;

  static Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'messages.db'),
        version: 1, onCreate: (Database db, int version) async {
      db.execute('''
          create table User(
          idUser integer primary key autoincrement,
          username text not null,
          email text not null,
          password text not null,
          image text
          );
          ''');
      db.execute('''
          create table Receiver(
          idReceiver integer primary key autoincrement,
          number text not null
          );
          ''');
      db.execute('''
          create table Messages(
          idMessage integer primary key autoincrement,
          idUser integer not null,
          time text not null;
          message text;
          unread text Default false,
          idReceiver integer not null,
          FOREIGN KEY(idUser) REFERENCES User(idUser),
          FOREIGN KEY(idReceiver) REFERENCES Receiver(idReceiver)
          );
          ''');
    });
  }

  //OPERATION ON USER
  Future<User> getUser(String email, String password) async {
    if (db == null) {
      await open();
    }
    User user = new User(0, null, email, password, null);
    String columnEmail = "email";
    String columnPassword = "password";
    List<Map> test;
    test = await db.query("User",
        columns: [columnEmail, columnPassword],
        where: "$columnEmail = ? and $columnPassword = ?",
        whereArgs: [email, password]);
    if (test.length == 0) {
      return user;
    } else {
      return null;
    }
    //return await db.query('Messages');
  }

  static Future insertUser(Map<String, dynamic> user) async {
    await db.insert('User', user);
  }

  static Future updateUser(Map<String, dynamic> user) async {
    await db
        .update('User', user, where: 'idUser = ?', whereArgs: [user['idUser']]);
  }

  //OPERATION ON MESSAGE
  static Future<List<Map<String, dynamic>>> getMessageList() async {
    if (db == null) {
      await open();
    }
    return await db.query('Messages');
  }

  static Future deleteMessage(int id) async {
    await db.delete('Messages', where: 'idMessage = ?', whereArgs: [id]);
  }

  static Future insertMessage(Map<String, dynamic> message) async {
    await db.insert('Messages', message);
  }

  //OPERATION ON RECEIVER
  static Future insertReceiver(Map<String, dynamic> receiver) async {
    await db.insert('Receiver', receiver);
  }

  static Future<List<Message>> listMessage() async{
    if (db == null) {
      await open();
    }

    var messages =await db.query("Messages",
    columns: ['idMessage', 'idUser', 'time', 'message', 'unread']);

    List<Message> messageList = List<Message>();

    messages.forEach((currentMessage) {
      Message message  = Message.map(currentMessage);
      messageList.add(message);
    });

    return messageList;
  }
}
