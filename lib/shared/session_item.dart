import 'package:flutter/material.dart';
import 'package:hello_flutter/data/session.dart';

class SessionItem extends StatelessWidget {
  const SessionItem(
      {Key? key, required this.session, required this.onDismissed})
      : super(key: key);

  final Session session;
  final Function onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        onDismissed();
      },
      child: ListTile(
        title: Text(session.description),
        subtitle: Text(
            '${session.id} - ${session.date} - duration: ${session.duration} min'),
      ),
    );
  }
}
