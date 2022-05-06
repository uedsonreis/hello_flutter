import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'session.dart';

class SessionRepository {
  static late SharedPreferences _dao;
  static const String ID_KEY = 'sequence';

  Future init() async {
    _dao = await SharedPreferences.getInstance();
  }

  int getSequence() {
    int sequence = _dao.getInt(ID_KEY) ?? 0;
    sequence++;
    _dao.setInt(ID_KEY, sequence);
    return sequence;
  }

  Future save(Session session) async {
    if (session.id == 0) {
      session.id = getSequence();
    }
    _dao.setString(session.id.toString(), json.encode(session.toMap()));
  }

  List<Session> getList() {
    List<Session> sessions = [];

    _dao.getKeys().forEach((key) {
      if (key != ID_KEY) {
        sessions.add(Session.fromJson(json.decode(_dao.getString(key) ?? '')));
      }
    });

    return sessions;
  }

  Future<bool> delete(int id) async {
    return await _dao.remove(id.toString());
  }
}
