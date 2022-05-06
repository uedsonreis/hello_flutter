import 'package:flutter/material.dart';
import 'package:hello_flutter/shared/menu_drawer.dart';
import 'package:hello_flutter/data/session_repository.dart';
import 'package:hello_flutter/data/session.dart';
import 'package:hello_flutter/shared/session_item.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];

  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();

  final SessionRepository dao = SessionRepository();

  @override
  void initState() {
    dao.init().then((value) => updateScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Training Sessions'),
      ),
      drawer: const MenuDrawer(),
      body: ListView(
        children: sessions
            .map((session) => SessionItem(
                  session: session,
                  onDismissed: () {
                    dao.delete(session.id).then((value) => updateScreen());
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insert Training Session'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: const InputDecoration(hintText: 'Duration'),
                ),
              ],
            )),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                  txtDescription.text = '';
                  txtDuration.text = '';
                },
              ),
              ElevatedButton(
                child: const Text('Save'),
                onPressed: saveSession,
              ),
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    Session newSession = Session(
        today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    dao.save(newSession);

    updateScreen();

    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  void updateScreen() {
    sessions = dao.getList();
    setState(() {});
  }
}
