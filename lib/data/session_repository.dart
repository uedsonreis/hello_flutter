import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'session.dart';

class SessionRepository {
  static late SharedPreferences _dao;

  Future init() async {
    _dao = await SharedPreferences.getInstance();
  }

  Future save(Session session) async {
    _dao.setString(session.id.toString(), json.encode(session.toMap()));
  }
}
